import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_event.freezed.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.validateEmail(String email) = ValidateEmail;

  const factory SignInEvent.validatePassword(String password) = ValidatePassword;

  const factory SignInEvent.signIn(
    String email,
    String password,
  ) = SignIn;

  const factory SignInEvent.validate(String email, String password) = Validate;
}
