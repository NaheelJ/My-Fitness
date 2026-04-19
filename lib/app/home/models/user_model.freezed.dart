// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  int get currentDay => throw _privateConstructorUsedError;
  int get streak => throw _privateConstructorUsedError;
  int get skipTokens => throw _privateConstructorUsedError;
  List<double> get weeklyWeights => throw _privateConstructorUsedError;
  DateTime? get lastActiveDate => throw _privateConstructorUsedError;
  bool get isComebackMode => throw _privateConstructorUsedError;
  int get missedDaysCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      int currentDay,
      int streak,
      int skipTokens,
      List<double> weeklyWeights,
      DateTime? lastActiveDate,
      bool isComebackMode,
      int missedDaysCount});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? currentDay = null,
    Object? streak = null,
    Object? skipTokens = null,
    Object? weeklyWeights = null,
    Object? lastActiveDate = freezed,
    Object? isComebackMode = null,
    Object? missedDaysCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      currentDay: null == currentDay
          ? _value.currentDay
          : currentDay // ignore: cast_nullable_to_non_nullable
              as int,
      streak: null == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      skipTokens: null == skipTokens
          ? _value.skipTokens
          : skipTokens // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyWeights: null == weeklyWeights
          ? _value.weeklyWeights
          : weeklyWeights // ignore: cast_nullable_to_non_nullable
              as List<double>,
      lastActiveDate: freezed == lastActiveDate
          ? _value.lastActiveDate
          : lastActiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isComebackMode: null == isComebackMode
          ? _value.isComebackMode
          : isComebackMode // ignore: cast_nullable_to_non_nullable
              as bool,
      missedDaysCount: null == missedDaysCount
          ? _value.missedDaysCount
          : missedDaysCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int currentDay,
      int streak,
      int skipTokens,
      List<double> weeklyWeights,
      DateTime? lastActiveDate,
      bool isComebackMode,
      int missedDaysCount});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? currentDay = null,
    Object? streak = null,
    Object? skipTokens = null,
    Object? weeklyWeights = null,
    Object? lastActiveDate = freezed,
    Object? isComebackMode = null,
    Object? missedDaysCount = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      currentDay: null == currentDay
          ? _value.currentDay
          : currentDay // ignore: cast_nullable_to_non_nullable
              as int,
      streak: null == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      skipTokens: null == skipTokens
          ? _value.skipTokens
          : skipTokens // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyWeights: null == weeklyWeights
          ? _value._weeklyWeights
          : weeklyWeights // ignore: cast_nullable_to_non_nullable
              as List<double>,
      lastActiveDate: freezed == lastActiveDate
          ? _value.lastActiveDate
          : lastActiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isComebackMode: null == isComebackMode
          ? _value.isComebackMode
          : isComebackMode // ignore: cast_nullable_to_non_nullable
              as bool,
      missedDaysCount: null == missedDaysCount
          ? _value.missedDaysCount
          : missedDaysCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {required this.id,
      this.currentDay = 1,
      this.streak = 0,
      this.skipTokens = 0,
      final List<double> weeklyWeights = const [],
      this.lastActiveDate,
      this.isComebackMode = false,
      this.missedDaysCount = 0})
      : _weeklyWeights = weeklyWeights;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final int currentDay;
  @override
  @JsonKey()
  final int streak;
  @override
  @JsonKey()
  final int skipTokens;
  final List<double> _weeklyWeights;
  @override
  @JsonKey()
  List<double> get weeklyWeights {
    if (_weeklyWeights is EqualUnmodifiableListView) return _weeklyWeights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyWeights);
  }

  @override
  final DateTime? lastActiveDate;
  @override
  @JsonKey()
  final bool isComebackMode;
  @override
  @JsonKey()
  final int missedDaysCount;

  @override
  String toString() {
    return 'UserModel(id: $id, currentDay: $currentDay, streak: $streak, skipTokens: $skipTokens, weeklyWeights: $weeklyWeights, lastActiveDate: $lastActiveDate, isComebackMode: $isComebackMode, missedDaysCount: $missedDaysCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.currentDay, currentDay) ||
                other.currentDay == currentDay) &&
            (identical(other.streak, streak) || other.streak == streak) &&
            (identical(other.skipTokens, skipTokens) ||
                other.skipTokens == skipTokens) &&
            const DeepCollectionEquality()
                .equals(other._weeklyWeights, _weeklyWeights) &&
            (identical(other.lastActiveDate, lastActiveDate) ||
                other.lastActiveDate == lastActiveDate) &&
            (identical(other.isComebackMode, isComebackMode) ||
                other.isComebackMode == isComebackMode) &&
            (identical(other.missedDaysCount, missedDaysCount) ||
                other.missedDaysCount == missedDaysCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      currentDay,
      streak,
      skipTokens,
      const DeepCollectionEquality().hash(_weeklyWeights),
      lastActiveDate,
      isComebackMode,
      missedDaysCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final String id,
      final int currentDay,
      final int streak,
      final int skipTokens,
      final List<double> weeklyWeights,
      final DateTime? lastActiveDate,
      final bool isComebackMode,
      final int missedDaysCount}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  int get currentDay;
  @override
  int get streak;
  @override
  int get skipTokens;
  @override
  List<double> get weeklyWeights;
  @override
  DateTime? get lastActiveDate;
  @override
  bool get isComebackMode;
  @override
  int get missedDaysCount;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
