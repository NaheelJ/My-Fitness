// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DayModel _$DayModelFromJson(Map<String, dynamic> json) {
  return _DayModel.fromJson(json);
}

/// @nodoc
mixin _$DayModel {
  String get id =>
      throw _privateConstructorUsedError; // Typically date string yyyy-MM-dd
  DateTime get date => throw _privateConstructorUsedError;
  DayType get dayType => throw _privateConstructorUsedError;
  double get completionPercentage => throw _privateConstructorUsedError;
  bool get isLocked => throw _privateConstructorUsedError; // Checklist items
  bool get wakeUpOnTime => throw _privateConstructorUsedError;
  bool get prayerCompleted => throw _privateConstructorUsedError;
  bool get breakfast => throw _privateConstructorUsedError;
  bool get lunch => throw _privateConstructorUsedError;
  bool get eveningNutrition => throw _privateConstructorUsedError;
  bool get dinner => throw _privateConstructorUsedError;
  double get waterIntake => throw _privateConstructorUsedError; // In litres
  bool get workoutCompleted => throw _privateConstructorUsedError;
  bool get noSmoking => throw _privateConstructorUsedError;
  bool get noPorn => throw _privateConstructorUsedError;
  bool get sleepOnTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayModelCopyWith<DayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayModelCopyWith<$Res> {
  factory $DayModelCopyWith(DayModel value, $Res Function(DayModel) then) =
      _$DayModelCopyWithImpl<$Res, DayModel>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      DayType dayType,
      double completionPercentage,
      bool isLocked,
      bool wakeUpOnTime,
      bool prayerCompleted,
      bool breakfast,
      bool lunch,
      bool eveningNutrition,
      bool dinner,
      double waterIntake,
      bool workoutCompleted,
      bool noSmoking,
      bool noPorn,
      bool sleepOnTime});
}

/// @nodoc
class _$DayModelCopyWithImpl<$Res, $Val extends DayModel>
    implements $DayModelCopyWith<$Res> {
  _$DayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? dayType = null,
    Object? completionPercentage = null,
    Object? isLocked = null,
    Object? wakeUpOnTime = null,
    Object? prayerCompleted = null,
    Object? breakfast = null,
    Object? lunch = null,
    Object? eveningNutrition = null,
    Object? dinner = null,
    Object? waterIntake = null,
    Object? workoutCompleted = null,
    Object? noSmoking = null,
    Object? noPorn = null,
    Object? sleepOnTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dayType: null == dayType
          ? _value.dayType
          : dayType // ignore: cast_nullable_to_non_nullable
              as DayType,
      completionPercentage: null == completionPercentage
          ? _value.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      wakeUpOnTime: null == wakeUpOnTime
          ? _value.wakeUpOnTime
          : wakeUpOnTime // ignore: cast_nullable_to_non_nullable
              as bool,
      prayerCompleted: null == prayerCompleted
          ? _value.prayerCompleted
          : prayerCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      breakfast: null == breakfast
          ? _value.breakfast
          : breakfast // ignore: cast_nullable_to_non_nullable
              as bool,
      lunch: null == lunch
          ? _value.lunch
          : lunch // ignore: cast_nullable_to_non_nullable
              as bool,
      eveningNutrition: null == eveningNutrition
          ? _value.eveningNutrition
          : eveningNutrition // ignore: cast_nullable_to_non_nullable
              as bool,
      dinner: null == dinner
          ? _value.dinner
          : dinner // ignore: cast_nullable_to_non_nullable
              as bool,
      waterIntake: null == waterIntake
          ? _value.waterIntake
          : waterIntake // ignore: cast_nullable_to_non_nullable
              as double,
      workoutCompleted: null == workoutCompleted
          ? _value.workoutCompleted
          : workoutCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      noSmoking: null == noSmoking
          ? _value.noSmoking
          : noSmoking // ignore: cast_nullable_to_non_nullable
              as bool,
      noPorn: null == noPorn
          ? _value.noPorn
          : noPorn // ignore: cast_nullable_to_non_nullable
              as bool,
      sleepOnTime: null == sleepOnTime
          ? _value.sleepOnTime
          : sleepOnTime // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayModelImplCopyWith<$Res>
    implements $DayModelCopyWith<$Res> {
  factory _$$DayModelImplCopyWith(
          _$DayModelImpl value, $Res Function(_$DayModelImpl) then) =
      __$$DayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      DayType dayType,
      double completionPercentage,
      bool isLocked,
      bool wakeUpOnTime,
      bool prayerCompleted,
      bool breakfast,
      bool lunch,
      bool eveningNutrition,
      bool dinner,
      double waterIntake,
      bool workoutCompleted,
      bool noSmoking,
      bool noPorn,
      bool sleepOnTime});
}

/// @nodoc
class __$$DayModelImplCopyWithImpl<$Res>
    extends _$DayModelCopyWithImpl<$Res, _$DayModelImpl>
    implements _$$DayModelImplCopyWith<$Res> {
  __$$DayModelImplCopyWithImpl(
      _$DayModelImpl _value, $Res Function(_$DayModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? dayType = null,
    Object? completionPercentage = null,
    Object? isLocked = null,
    Object? wakeUpOnTime = null,
    Object? prayerCompleted = null,
    Object? breakfast = null,
    Object? lunch = null,
    Object? eveningNutrition = null,
    Object? dinner = null,
    Object? waterIntake = null,
    Object? workoutCompleted = null,
    Object? noSmoking = null,
    Object? noPorn = null,
    Object? sleepOnTime = null,
  }) {
    return _then(_$DayModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dayType: null == dayType
          ? _value.dayType
          : dayType // ignore: cast_nullable_to_non_nullable
              as DayType,
      completionPercentage: null == completionPercentage
          ? _value.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      wakeUpOnTime: null == wakeUpOnTime
          ? _value.wakeUpOnTime
          : wakeUpOnTime // ignore: cast_nullable_to_non_nullable
              as bool,
      prayerCompleted: null == prayerCompleted
          ? _value.prayerCompleted
          : prayerCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      breakfast: null == breakfast
          ? _value.breakfast
          : breakfast // ignore: cast_nullable_to_non_nullable
              as bool,
      lunch: null == lunch
          ? _value.lunch
          : lunch // ignore: cast_nullable_to_non_nullable
              as bool,
      eveningNutrition: null == eveningNutrition
          ? _value.eveningNutrition
          : eveningNutrition // ignore: cast_nullable_to_non_nullable
              as bool,
      dinner: null == dinner
          ? _value.dinner
          : dinner // ignore: cast_nullable_to_non_nullable
              as bool,
      waterIntake: null == waterIntake
          ? _value.waterIntake
          : waterIntake // ignore: cast_nullable_to_non_nullable
              as double,
      workoutCompleted: null == workoutCompleted
          ? _value.workoutCompleted
          : workoutCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      noSmoking: null == noSmoking
          ? _value.noSmoking
          : noSmoking // ignore: cast_nullable_to_non_nullable
              as bool,
      noPorn: null == noPorn
          ? _value.noPorn
          : noPorn // ignore: cast_nullable_to_non_nullable
              as bool,
      sleepOnTime: null == sleepOnTime
          ? _value.sleepOnTime
          : sleepOnTime // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DayModelImpl implements _DayModel {
  const _$DayModelImpl(
      {required this.id,
      required this.date,
      required this.dayType,
      this.completionPercentage = 0.0,
      this.isLocked = false,
      this.wakeUpOnTime = false,
      this.prayerCompleted = false,
      this.breakfast = false,
      this.lunch = false,
      this.eveningNutrition = false,
      this.dinner = false,
      this.waterIntake = 0.0,
      this.workoutCompleted = false,
      this.noSmoking = false,
      this.noPorn = false,
      this.sleepOnTime = false});

  factory _$DayModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayModelImplFromJson(json);

  @override
  final String id;
// Typically date string yyyy-MM-dd
  @override
  final DateTime date;
  @override
  final DayType dayType;
  @override
  @JsonKey()
  final double completionPercentage;
  @override
  @JsonKey()
  final bool isLocked;
// Checklist items
  @override
  @JsonKey()
  final bool wakeUpOnTime;
  @override
  @JsonKey()
  final bool prayerCompleted;
  @override
  @JsonKey()
  final bool breakfast;
  @override
  @JsonKey()
  final bool lunch;
  @override
  @JsonKey()
  final bool eveningNutrition;
  @override
  @JsonKey()
  final bool dinner;
  @override
  @JsonKey()
  final double waterIntake;
// In litres
  @override
  @JsonKey()
  final bool workoutCompleted;
  @override
  @JsonKey()
  final bool noSmoking;
  @override
  @JsonKey()
  final bool noPorn;
  @override
  @JsonKey()
  final bool sleepOnTime;

  @override
  String toString() {
    return 'DayModel(id: $id, date: $date, dayType: $dayType, completionPercentage: $completionPercentage, isLocked: $isLocked, wakeUpOnTime: $wakeUpOnTime, prayerCompleted: $prayerCompleted, breakfast: $breakfast, lunch: $lunch, eveningNutrition: $eveningNutrition, dinner: $dinner, waterIntake: $waterIntake, workoutCompleted: $workoutCompleted, noSmoking: $noSmoking, noPorn: $noPorn, sleepOnTime: $sleepOnTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dayType, dayType) || other.dayType == dayType) &&
            (identical(other.completionPercentage, completionPercentage) ||
                other.completionPercentage == completionPercentage) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked) &&
            (identical(other.wakeUpOnTime, wakeUpOnTime) ||
                other.wakeUpOnTime == wakeUpOnTime) &&
            (identical(other.prayerCompleted, prayerCompleted) ||
                other.prayerCompleted == prayerCompleted) &&
            (identical(other.breakfast, breakfast) ||
                other.breakfast == breakfast) &&
            (identical(other.lunch, lunch) || other.lunch == lunch) &&
            (identical(other.eveningNutrition, eveningNutrition) ||
                other.eveningNutrition == eveningNutrition) &&
            (identical(other.dinner, dinner) || other.dinner == dinner) &&
            (identical(other.waterIntake, waterIntake) ||
                other.waterIntake == waterIntake) &&
            (identical(other.workoutCompleted, workoutCompleted) ||
                other.workoutCompleted == workoutCompleted) &&
            (identical(other.noSmoking, noSmoking) ||
                other.noSmoking == noSmoking) &&
            (identical(other.noPorn, noPorn) || other.noPorn == noPorn) &&
            (identical(other.sleepOnTime, sleepOnTime) ||
                other.sleepOnTime == sleepOnTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      dayType,
      completionPercentage,
      isLocked,
      wakeUpOnTime,
      prayerCompleted,
      breakfast,
      lunch,
      eveningNutrition,
      dinner,
      waterIntake,
      workoutCompleted,
      noSmoking,
      noPorn,
      sleepOnTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DayModelImplCopyWith<_$DayModelImpl> get copyWith =>
      __$$DayModelImplCopyWithImpl<_$DayModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayModelImplToJson(
      this,
    );
  }
}

abstract class _DayModel implements DayModel {
  const factory _DayModel(
      {required final String id,
      required final DateTime date,
      required final DayType dayType,
      final double completionPercentage,
      final bool isLocked,
      final bool wakeUpOnTime,
      final bool prayerCompleted,
      final bool breakfast,
      final bool lunch,
      final bool eveningNutrition,
      final bool dinner,
      final double waterIntake,
      final bool workoutCompleted,
      final bool noSmoking,
      final bool noPorn,
      final bool sleepOnTime}) = _$DayModelImpl;

  factory _DayModel.fromJson(Map<String, dynamic> json) =
      _$DayModelImpl.fromJson;

  @override
  String get id;
  @override // Typically date string yyyy-MM-dd
  DateTime get date;
  @override
  DayType get dayType;
  @override
  double get completionPercentage;
  @override
  bool get isLocked;
  @override // Checklist items
  bool get wakeUpOnTime;
  @override
  bool get prayerCompleted;
  @override
  bool get breakfast;
  @override
  bool get lunch;
  @override
  bool get eveningNutrition;
  @override
  bool get dinner;
  @override
  double get waterIntake;
  @override // In litres
  bool get workoutCompleted;
  @override
  bool get noSmoking;
  @override
  bool get noPorn;
  @override
  bool get sleepOnTime;
  @override
  @JsonKey(ignore: true)
  _$$DayModelImplCopyWith<_$DayModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
