import 'package:flutter/material.dart';
import '../../../core/services/local_storage_service.dart';
import '../models/day_model.dart';
import '../models/user_model.dart';
import 'package:intl/intl.dart';

import '../../../core/services/firestore_service.dart';

class RoutineController extends ChangeNotifier {
  final LocalStorageService _storage;
  final FirestoreService _firestore;
  
  DayModel? _currentDay;
  UserModel? _user;

  RoutineController(this._storage, this._firestore);

  DayModel? get currentDay => _currentDay;
  UserModel? get user => _user;

  String get todayId => DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<void> init() async {
    _user = _storage.getUser('main_user');
    if (_user == null) {
      _user = UserModel(
        id: 'main_user',
        lastActiveDate: DateTime.now(),
      );
      await _storage.saveUser(_user!);
    }

    _handleMissedDays();

    _currentDay = _storage.getDay(todayId);
    if (_currentDay == null) {
      _currentDay = DayModel(
        id: todayId,
        date: DateTime.now(),
        dayType: DayType.working,
      );
      await _storage.saveDay(_currentDay!);
    }
    
    notifyListeners();
  }

  Future<void> _handleMissedDays() async {
    if (_user == null || _user!.lastActiveDate == null) return;

    final now = DateTime.now();
    final lastDate = _user!.lastActiveDate!;
    final difference = DateTime(now.year, now.month, now.day)
        .difference(DateTime(lastDate.year, lastDate.month, lastDate.day))
        .inDays;

    if (difference <= 1) {
      // User active recently or yesterday, update lastActiveDate
      _user = _user!.copyWith(lastActiveDate: now);
      await _storage.saveUser(_user!);
      return;
    }

    // Handle missed days (difference > 1 means at least one day was entirely skipped)
    final missedDays = difference - 1;
    int currentMissedCount = (_user!.missedDaysCount) + missedDays;

    UserModel updatedUser = _user!.copyWith(
      missedDaysCount: currentMissedCount,
      lastActiveDate: now,
    );

    if (currentMissedCount >= 7) {
      // RESET RULE: 7 days missed -> Back to Day 1
      updatedUser = updatedUser.copyWith(
        currentDay: 1,
        streak: 0,
        missedDaysCount: 0,
        isComebackMode: false,
      );
    } else if (currentMissedCount >= 3) {
      // COMEBACK MODE: 3-6 days missed
      updatedUser = updatedUser.copyWith(
        isComebackMode: true,
        streak: 0, // Breaking streak but not resetting day
      );
    } else {
      // 1-2 days missed -> Allowed, but streak breaks
      updatedUser = updatedUser.copyWith(
        streak: 0,
      );
    }

    _user = updatedUser;
    await _storage.saveUser(_user!);
  }

  Future<void> completeDay() async {
    if (_currentDay == null || _user == null) return;
    
    final completion = _currentDay!.completionPercentage;
    UserModel updatedUser = _user!;

    if (completion >= 80) {
      // SUCCESSFUL DAY
      updatedUser = updatedUser.copyWith(
        streak: updatedUser.streak + 1,
        currentDay: updatedUser.currentDay + 1,
        missedDaysCount: 0, // Reset missed count on success
        isComebackMode: false,
      );
    } else {
      // FAILED DAY (< 80%)
      updatedUser = updatedUser.copyWith(
        streak: 0,
        missedDaysCount: updatedUser.missedDaysCount + 1,
      );
    }

    _user = updatedUser;
    _currentDay = _currentDay!.copyWith(isLocked: true);
    
    if (completion >= 80) {
      _checkAndRewardSkipToken();
    }

    await _storage.saveUser(_user!);
    await _storage.saveDay(_currentDay!);
    notifyListeners();
  }

  void _checkAndRewardSkipToken() {
    if (_user == null) return;
    // Reward 1 skip token every 7 successful days
    if (_user!.streak > 0 && _user!.streak % 7 == 0) {
      _user = _user!.copyWith(skipTokens: _user!.skipTokens + 1);
    }
  }

  Future<void> useSkipToken() async {
    if (_user == null || _user!.skipTokens <= 0 || _currentDay == null) return;
    
    _user = _user!.copyWith(skipTokens: _user!.skipTokens - 1);
    _currentDay = _currentDay!.copyWith(
      completionPercentage: 80.0, // Force success
      isLocked: true,
    );
    
    // Manual completion logic to increment day/streak
    _user = _user!.copyWith(
      streak: _user!.streak + 1,
      currentDay: _user!.currentDay + 1,
    );

    await _storage.saveUser(_user!);
    await _storage.saveDay(_currentDay!);
    notifyListeners();
  }

  Future<void> addWeight(double weight) async {
    if (_user == null) return;
    final updatedWeights = List<double>.from(_user!.weeklyWeights)..add(weight);
    _user = _user!.copyWith(weeklyWeights: updatedWeights);
    await _storage.saveUser(_user!);
    _syncToCloud();
    notifyListeners();
  }

  Future<void> resetProgress() async {
    if (_user == null) return;
    _user = _user!.copyWith(
      currentDay: 1,
      streak: 0,
      lastActiveDate: DateTime.now(),
    );
    await _storage.saveUser(_user!);
    
    // Reset today's progress too if desired
    _currentDay = _currentDay!.copyWith(
      completionPercentage: 0,
      wakeUpOnTime: false,
      prayerCompleted: false,
      breakfast: false,
      lunch: false,
      eveningNutrition: false,
      dinner: false,
      waterIntake: 0,
      workoutCompleted: false,
      noSmoking: false,
      noPorn: false,
      sleepOnTime: false,
    );
    await _storage.saveDay(_currentDay!);
    
    notifyListeners();
  }

  Future<void> clearAllData() async {
    // In a real app, we'd clear Hive boxes
    // For now, we reset user and current day to defaults
    _user = const UserModel(id: 'main_user');
    await _storage.saveUser(_user!);
    
    _currentDay = DayModel(
      id: todayId,
      date: DateTime.now(),
      dayType: DayType.working,
    );
    await _storage.saveDay(_currentDay!);
    
    notifyListeners();
  }

  Future<void> toggleTask(String taskKey) async {
    if (_currentDay == null || _currentDay!.isLocked) return;

    DayModel updatedDay;
    switch (taskKey) {
      case 'wakeUpOnTime':
        updatedDay = _currentDay!.copyWith(wakeUpOnTime: !_currentDay!.wakeUpOnTime);
        break;
      case 'prayerCompleted':
        updatedDay = _currentDay!.copyWith(prayerCompleted: !_currentDay!.prayerCompleted);
        break;
      case 'breakfast':
        updatedDay = _currentDay!.copyWith(breakfast: !_currentDay!.breakfast);
        break;
      case 'lunch':
        updatedDay = _currentDay!.copyWith(lunch: !_currentDay!.lunch);
        break;
      case 'eveningNutrition':
        updatedDay = _currentDay!.copyWith(eveningNutrition: !_currentDay!.eveningNutrition);
        break;
      case 'dinner':
        updatedDay = _currentDay!.copyWith(dinner: !_currentDay!.dinner);
        break;
      case 'workoutCompleted':
        updatedDay = _currentDay!.copyWith(workoutCompleted: !_currentDay!.workoutCompleted);
        break;
      case 'noSmoking':
        updatedDay = _currentDay!.copyWith(noSmoking: !_currentDay!.noSmoking);
        break;
      case 'noPorn':
        updatedDay = _currentDay!.copyWith(noPorn: !_currentDay!.noPorn);
        break;
      case 'sleepOnTime':
        updatedDay = _currentDay!.copyWith(sleepOnTime: !_currentDay!.sleepOnTime);
        break;
      default:
        return;
    }

    _currentDay = updatedDay.copyWith(
      completionPercentage: _calculateCompletion(updatedDay),
    );
    
    await _storage.saveDay(_currentDay!);
    notifyListeners();
  }

  Future<void> updateWater(double amount) async {
    if (_currentDay == null || _currentDay!.isLocked) return;
    
    _currentDay = _currentDay!.copyWith(
      waterIntake: amount,
      completionPercentage: _calculateCompletion(_currentDay!.copyWith(waterIntake: amount)),
    );
    
    await _storage.saveDay(_currentDay!);
    notifyListeners();
  }

  Future<void> setDayType(DayType type) async {
    if (_currentDay == null || _currentDay!.isLocked) return;
    
    _currentDay = _currentDay!.copyWith(dayType: type);
    _currentDay = _currentDay!.copyWith(completionPercentage: _calculateCompletion(_currentDay!));
    
    await _storage.saveDay(_currentDay!);
    notifyListeners();
  }

  double _calculateCompletion(DayModel day) {
    int totalTasks = 11; // 10 toggles + water
    int completedTasks = 0;

    if (day.wakeUpOnTime) completedTasks++;
    if (day.prayerCompleted) completedTasks++;
    if (day.breakfast) completedTasks++;
    if (day.lunch) completedTasks++;
    if (day.eveningNutrition) completedTasks++;
    if (day.dinner) completedTasks++;
    if (day.workoutCompleted) completedTasks++;
    if (day.noSmoking) completedTasks++;
    if (day.noPorn) completedTasks++;
    if (day.sleepOnTime) completedTasks++;
    
    // Water intake (goal 2.5L)
    if (day.waterIntake >= 2.5) completedTasks++;

    return (completedTasks / totalTasks) * 100;
  }

  void _syncToCloud() {
    if (_user != null) {
      _firestore.syncUser(_user!);
      if (_currentDay != null) {
        _firestore.syncDay(_user!.id, _currentDay!);
      }
    }
  }
}
