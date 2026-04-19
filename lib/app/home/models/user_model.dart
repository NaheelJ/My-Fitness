import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    @Default(1) int currentDay,
    @Default(0) int streak,
    @Default(0) int skipTokens,
    @Default([]) List<double> weeklyWeights,
    DateTime? lastActiveDate,
    @Default(false) bool isComebackMode,
    @Default(0) int missedDaysCount,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
