import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_time_valid_email_event.freezed.dart';

@freezed
class ForgetPasswordTimeValidEmailEvent with _$ForgetPasswordTimeValidEmailEvent {
  const factory ForgetPasswordTimeValidEmailEvent.initial() = ValidateTimeEmailInitial;
}
