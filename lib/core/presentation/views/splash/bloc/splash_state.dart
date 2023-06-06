import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _$SplashStateInitial;

  const factory SplashState.success({
    required UserModel? user,
  }) = _$SplashStateSuccess;

  const factory SplashState.error({
    required String message,
  }) = _$SplashStateError;
}
