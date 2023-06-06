import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_event.freezed.dart';

@freezed
class ForgetPasswordEvent with _$ForgetPasswordEvent {
  const factory ForgetPasswordEvent.validatePassword(
    String email,
    String confirmPassword,
    String password,
  ) = ValidateNewPassword;

  const factory ForgetPasswordEvent.validateEmail(
    String email,
    String confirmPassword,
    String password,
  ) = ValidateNewEmail;

  const factory ForgetPasswordEvent.validateConfirmPassword(
    String email,
    String confirmPassword,
    String password,
  ) = ValidateNewConfirmePassword;

  const factory ForgetPasswordEvent.forgetPasswordButton(
    String email,
    String confirmPassword,
    String password,
  ) = ForgetPasswordButton;
}
