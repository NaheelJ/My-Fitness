import 'package:hive_flutter/hive_flutter.dart';
import '../../app/home/models/day_model.dart';
import '../../app/home/models/user_model.dart';

class LocalStorageService {
  static const String dayBoxName = 'days';
  static const String userBoxName = 'user';

  Future<void> init() async {
    await Hive.initFlutter();
    
    // Register Adapters if needed (for custom classes)
    // Note: Since we use JSON for Hive with these models (optionally) 
    // or we can use TypeAdapters. For simplicity with freezed, 
    // sometimes storing as Map/JSON is easier or we generate Adapters.
    // I will generate Adapters for them if I want native Hive performance.
    // But for now, let's assume we store them as JSON strings or Maps.
  }

  Box<Map> get dayBox => Hive.box<Map>(dayBoxName);
  Box<Map> get userBox => Hive.box<Map>(userBoxName);

  Future<void> openBoxes() async {
    await Hive.openBox<Map>(dayBoxName);
    await Hive.openBox<Map>(userBoxName);
  }

  Future<void> saveDay(DayModel day) async {
    await dayBox.put(day.id, day.toJson());
  }

  DayModel? getDay(String id) {
    final data = dayBox.get(id);
    if (data == null) return null;
    return DayModel.fromJson(Map<String, dynamic>.from(data));
  }

  Future<void> saveUser(UserModel user) async {
    await userBox.put(user.id, user.toJson());
  }

  UserModel? getUser(String id) {
    final data = userBox.get(id);
    if (data == null) return null;
    return UserModel.fromJson(Map<String, dynamic>.from(data));
  }
}
