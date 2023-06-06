import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_enter_email_event.freezed.dart';

@freezed
class ForgetPasswordEnterEmailEvent with _$ForgetPasswordEnterEmailEvent {
  const factory ForgetPasswordEnterEmailEvent.validateEmail(
    String email,
  ) = ValidateEnterEmail;

  const factory ForgetPasswordEnterEmailEvent.forgetPasswordButton(
    String email,
  ) = ForgetEnterEmailButton;
}
