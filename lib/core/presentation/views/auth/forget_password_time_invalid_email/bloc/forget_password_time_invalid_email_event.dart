import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_time_invalid_email_event.freezed.dart';

@freezed
class ForgetPasswordTimeInvalidEmailEvent with _$ForgetPasswordTimeInvalidEmailEvent {
  const factory ForgetPasswordTimeInvalidEmailEvent.validEmail(
    String email,
  ) = ValidateTimeInvalidEmail;

  const factory ForgetPasswordTimeInvalidEmailEvent.submit(
    String email,
  ) = ValidateTimeInvalidSubmit;
}
