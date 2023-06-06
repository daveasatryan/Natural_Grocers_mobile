import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/enums/validation_valid_invalid.dart';

part 'forget_password_time_invalid_email_state.freezed.dart';

@freezed
class ForgetPasswordTimeInvalidEmailState with _$ForgetPasswordTimeInvalidEmailState {
  const factory ForgetPasswordTimeInvalidEmailState.loading() =
      _$ForgetPasswordTimeInvalidEmailStateLoading;

  const factory ForgetPasswordTimeInvalidEmailState.success() =
      _$ForgetPasswordTimeInvalidEmailStateSuccess;

  const factory ForgetPasswordTimeInvalidEmailState.error({
    required String msg,
    required String errorCode,
  }) = _$ForgetPasswordTimeInvalidEmailStateError;

  const factory ForgetPasswordTimeInvalidEmailState.logout({
    required String msg,
    required String errorCode,
  }) = _$ForgetPasswordTimeInvalidEmailStateLogout;

  const factory ForgetPasswordTimeInvalidEmailState.validation({
    required ValidationEnum email,
    required ValidationValidInvalid button,
  }) = _$ForgetPasswordTimeInvalidEmailStateValidation;
}

extension ForgetPasswordTimeInvalidEmailStateExt on ForgetPasswordTimeInvalidEmailState {
  bool buildWhen() => when(
        loading: () => false,
        success: () => true,
        error: (_, __) => false,
        logout: (_, __) => false,
        validation: (_, __) => true,
      );

  bool listenWhen() => !buildWhen();
}
