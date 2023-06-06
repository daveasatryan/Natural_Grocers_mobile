import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/enums/validation_valid_invalid.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';

part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.loading() = _$EditProfileStateLoading;

  const factory EditProfileState.success({
    required UserModel? user,
  }) = _$EditProfileStateSuccess;

  const factory EditProfileState.error({
    required String msg,
  }) = _$EditProfileStateError;

  const factory EditProfileState.validation({
    required ValidationEnum email,
    required ValidationEnum phoneNumberValidation,
    required ValidationEnum confirmPasswordValidation,
    required ValidationEnum currentPasswordValidation,
    required ValidationEnum password,
    required ValidationValidInvalid passwordCharacterValidation,
    required ValidationValidInvalid passwordLowerUpperValidation,
    required ValidationValidInvalid passwordLeastCharactersValidation,
    required ValidationValidInvalid passwordWordDigitValidation,
    required ValidationValidInvalid saveButtonValidation,
  }) = _$SignInStateValidation;
}

extension EditProfileStateExt on EditProfileState {
  bool buildWhen() => when(
        loading: () => false,
        success: (_) => false,
        error: (_) => false,
        validation: (_, __, ___, ____, _____, ______, _______, ________, _________, __________) =>
            true,
      );

  bool listenWhen() => !buildWhen();
}
