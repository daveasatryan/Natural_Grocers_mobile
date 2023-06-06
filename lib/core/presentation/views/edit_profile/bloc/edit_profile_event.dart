import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_event.freezed.dart';

@freezed
class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.validateEmail(String email) = ValidateEmailEdit;

  const factory EditProfileEvent.validatePhoneNumber(String phoneNumber) = ValidatePhoneNumberEdit;

  const factory EditProfileEvent.validateCurrentPassword(String currentPassword) =
      ValidateCurrentPasswordEdit;

  const factory EditProfileEvent.validatePassword(String password) = ValidatePasswordEdit;

  const factory EditProfileEvent.validateConfirmPassword(String confirmPassword, String password) =
      ValidateConfirmePasswordEdit;

  const factory EditProfileEvent.save(
    String email,
    String phoneNumber,
    String currentPassword,
    String password,
    String confirmPassword,
  ) = SaveEdit;
}
