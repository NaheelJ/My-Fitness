import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_model.freezed.dart';
part 'day_model.g.dart';

enum DayType { working, holiday }

@freezed
class DayModel with _$DayModel {
  const factory DayModel({
    required String id, // Typically date string yyyy-MM-dd
    required DateTime date,
    required DayType dayType,
    @Default(0.0) double completionPercentage,
    @Default(false) bool isLocked,
    
    // Checklist items
    @Default(false) bool wakeUpOnTime,
    @Default(false) bool prayerCompleted,
    @Default(false) bool breakfast,
    @Default(false) bool lunch,
    @Default(false) bool eveningNutrition,
    @Default(false) bool dinner,
    @Default(0.0) double waterIntake, // In litres
    @Default(false) bool workoutCompleted,
    @Default(false) bool noSmoking,
    @Default(false) bool noPorn,
    @Default(false) bool sleepOnTime,
  }) = _DayModel;

  factory DayModel.fromJson(Map<String, dynamic> json) => _$DayModelFromJson(json);
}
