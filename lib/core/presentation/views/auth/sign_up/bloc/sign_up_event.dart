import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';

part 'sign_up_event.freezed.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.validateEmail(String email) = ValidateEmail;

  const factory SignUpEvent.validatePhoneNumber(String phoneNumber) = ValidatePhoneNumber;

  const factory SignUpEvent.validatePassword(String password) = ValidatePassword;

  const factory SignUpEvent.validateConfirmPassword(String confirmPassword, String password) =
      ValidateConfirmePassword;

  const factory SignUpEvent.setPreferredStore(StoreModel? store) = SetPreferredStore;

  const factory SignUpEvent.signUp(
      String email, String phoneNumber, String password, String confirmPassword) = SignUp;

}
