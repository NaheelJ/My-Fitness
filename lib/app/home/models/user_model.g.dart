// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      currentDay: (json['currentDay'] as num?)?.toInt() ?? 1,
      streak: (json['streak'] as num?)?.toInt() ?? 0,
      skipTokens: (json['skipTokens'] as num?)?.toInt() ?? 0,
      weeklyWeights: (json['weeklyWeights'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
      lastActiveDate: json['lastActiveDate'] == null
          ? null
          : DateTime.parse(json['lastActiveDate'] as String),
      isComebackMode: json['isComebackMode'] as bool? ?? false,
      missedDaysCount: (json['missedDaysCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currentDay': instance.currentDay,
      'streak': instance.streak,
      'skipTokens': instance.skipTokens,
      'weeklyWeights': instance.weeklyWeights,
      'lastActiveDate': instance.lastActiveDate?.toIso8601String(),
      'isComebackMode': instance.isComebackMode,
      'missedDaysCount': instance.missedDaysCount,
    };
