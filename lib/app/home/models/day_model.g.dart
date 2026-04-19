// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DayModelImpl _$$DayModelImplFromJson(Map<String, dynamic> json) =>
    _$DayModelImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      dayType: $enumDecode(_$DayTypeEnumMap, json['dayType']),
      completionPercentage:
          (json['completionPercentage'] as num?)?.toDouble() ?? 0.0,
      isLocked: json['isLocked'] as bool? ?? false,
      wakeUpOnTime: json['wakeUpOnTime'] as bool? ?? false,
      prayerCompleted: json['prayerCompleted'] as bool? ?? false,
      breakfast: json['breakfast'] as bool? ?? false,
      lunch: json['lunch'] as bool? ?? false,
      eveningNutrition: json['eveningNutrition'] as bool? ?? false,
      dinner: json['dinner'] as bool? ?? false,
      waterIntake: (json['waterIntake'] as num?)?.toDouble() ?? 0.0,
      workoutCompleted: json['workoutCompleted'] as bool? ?? false,
      noSmoking: json['noSmoking'] as bool? ?? false,
      noPorn: json['noPorn'] as bool? ?? false,
      sleepOnTime: json['sleepOnTime'] as bool? ?? false,
    );

Map<String, dynamic> _$$DayModelImplToJson(_$DayModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'dayType': _$DayTypeEnumMap[instance.dayType]!,
      'completionPercentage': instance.completionPercentage,
      'isLocked': instance.isLocked,
      'wakeUpOnTime': instance.wakeUpOnTime,
      'prayerCompleted': instance.prayerCompleted,
      'breakfast': instance.breakfast,
      'lunch': instance.lunch,
      'eveningNutrition': instance.eveningNutrition,
      'dinner': instance.dinner,
      'waterIntake': instance.waterIntake,
      'workoutCompleted': instance.workoutCompleted,
      'noSmoking': instance.noSmoking,
      'noPorn': instance.noPorn,
      'sleepOnTime': instance.sleepOnTime,
    };

const _$DayTypeEnumMap = {
  DayType.working: 'working',
  DayType.holiday: 'holiday',
};
