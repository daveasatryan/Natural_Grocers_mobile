import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/enums/validation_valid_invalid.dart';

part 'forget_password_enter_email_state.freezed.dart';

@freezed
class ForgetPasswordEnterEmailState with _$ForgetPasswordEnterEmailState {
  const factory ForgetPasswordEnterEmailState.loading() = _$ForgetPasswordEnterEmailStateLoading;

  const factory ForgetPasswordEnterEmailState.success() = _$ForgetPasswordEnterEmailStateSuccess;

  const factory ForgetPasswordEnterEmailState.error({
    required String msg,
    required String errorCode,
  }) = _$ForgetPasswordEnterEmailStateError;

  const factory ForgetPasswordEnterEmailState.logout({
    required String msg,
    required String errorCode,
  }) = _$ForgetPasswordEnterEmailStateLogout;

  const factory ForgetPasswordEnterEmailState.enterEmail({
    required ValidationEnum email,
    required ValidationValidInvalid emailEnterButton,
  }) = _$ForgetPasswordEnterEmailStateEnterEmail;
}

extension ForgetPasswordEnterEmailStateExt on ForgetPasswordEnterEmailState {
  bool buildWhen() => when(
      loading: () => false,
      success: () => false,
      error: (_, __) => false,
      logout: (_, __) => false,
      enterEmail: (_, __) => true);

  bool listenWhen() => !buildWhen();
}
