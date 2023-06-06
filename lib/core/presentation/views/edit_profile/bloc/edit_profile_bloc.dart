import 'package:bloc/bloc.dart';
import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/enums/validation_valid_invalid.dart';
import 'package:natural_groceries/core/data/models/user/edit_user_model.dart';
import 'package:natural_groceries/core/data/usecases/user/edit_user_usecase.dart';
import 'package:natural_groceries/core/data/utilities/helper.dart';
import 'package:natural_groceries/core/data/utilities/storage/preferences_manager.dart';
import 'package:natural_groceries/core/data/validation_utils.dart';
import 'package:natural_groceries/core/presentation/views/edit_profile/bloc/edit_profile_event.dart';
import 'package:natural_groceries/core/presentation/views/edit_profile/bloc/edit_profile_state.dart';

@injectable
class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(this.editUserUseCase)
      : super(
          const EditProfileState.validation(
            email: ValidationEnum.none,
            phoneNumberValidation: ValidationEnum.none,
            currentPasswordValidation: ValidationEnum.none,
            password: ValidationEnum.none,
            confirmPasswordValidation: ValidationEnum.none,
            passwordCharacterValidation: ValidationValidInvalid.valid,
            passwordLeastCharactersValidation: ValidationValidInvalid.valid,
            passwordLowerUpperValidation: ValidationValidInvalid.valid,
            passwordWordDigitValidation: ValidationValidInvalid.valid,
            saveButtonValidation: ValidationValidInvalid.invalid,
          ),
        ) {
    on<ValidateEmailEdit>((event, emit) {
      emailValidation = ValidationEnum.none;
      validSaveButton();
      emit(EditProfileState.validation(
        email: emailValidation,
        password: passwordValidation,
        confirmPasswordValidation: confirmPasswordValidation,
        currentPasswordValidation: currentPasswordValidation,
        phoneNumberValidation: phoneNumberValidation,
        passwordCharacterValidation: passwordCharacterValidation,
        passwordLeastCharactersValidation: passwordLeastCharactersValidation,
        passwordLowerUpperValidation: passwordLowerUpperValidation,
        passwordWordDigitValidation: passwordWordDigitValidation,
        saveButtonValidation: saveValidation,
      ));
    });

    on<ValidatePhoneNumberEdit>((event, emit) {
      phoneNumberValidation = ValidationEnum.none;
      validSaveButton();

      emit(EditProfileState.validation(
        email: emailValidation,
        password: passwordValidation,
        confirmPasswordValidation: confirmPasswordValidation,
        currentPasswordValidation: currentPasswordValidation,
        phoneNumberValidation: phoneNumberValidation,
        passwordCharacterValidation: passwordCharacterValidation,
        passwordLeastCharactersValidation: passwordLeastCharactersValidation,
        passwordLowerUpperValidation: passwordLowerUpperValidation,
        passwordWordDigitValidation: passwordWordDigitValidation,
        saveButtonValidation: saveValidation,
      ));
    });
    on<ValidateCurrentPasswordEdit>((event, emit) {
      currentPasswordValidation = ValidationEnum.none;
      validSaveButton();

      emit(EditProfileState.validation(
        email: emailValidation,
        password: passwordValidation,
        confirmPasswordValidation: confirmPasswordValidation,
        currentPasswordValidation: currentPasswordValidation,
        phoneNumberValidation: phoneNumberValidation,
        passwordCharacterValidation: passwordCharacterValidation,
        passwordLeastCharactersValidation: passwordLeastCharactersValidation,
        passwordLowerUpperValidation: passwordLowerUpperValidation,
        passwordWordDigitValidation: passwordWordDigitValidation,
        saveButtonValidation: saveValidation,
      ));
    });

    on<ValidatePasswordEdit>(
      (event, emit) {
        passwordValidation = ValidationEnum.none;
        passwordCharacterValidation = ValidationValidInvalid.valid;
        passwordLeastCharactersValidation = ValidationValidInvalid.valid;
        passwordLowerUpperValidation = ValidationValidInvalid.valid;
        passwordWordDigitValidation = ValidationValidInvalid.valid;
        validSaveButton();

        emit(
          EditProfileState.validation(
            email: emailValidation,
            password: passwordValidation,
            confirmPasswordValidation: confirmPasswordValidation,
            currentPasswordValidation: currentPasswordValidation,
            phoneNumberValidation: phoneNumberValidation,
            passwordCharacterValidation: passwordCharacterValidation,
            passwordLeastCharactersValidation: passwordLeastCharactersValidation,
            passwordLowerUpperValidation: passwordLowerUpperValidation,
            passwordWordDigitValidation: passwordWordDigitValidation,
            saveButtonValidation: saveValidation,
          ),
        );
      },
    );

    on<ValidateConfirmePasswordEdit>((event, emit) {
      confirmPasswordValidation = ValidationEnum.none;
      validSaveButton();

      emit(EditProfileState.validation(
        email: emailValidation,
        password: passwordValidation,
        confirmPasswordValidation: confirmPasswordValidation,
        currentPasswordValidation: currentPasswordValidation,
        phoneNumberValidation: phoneNumberValidation,
        passwordCharacterValidation: passwordCharacterValidation,
        passwordLeastCharactersValidation: passwordLeastCharactersValidation,
        passwordLowerUpperValidation: passwordLowerUpperValidation,
        passwordWordDigitValidation: passwordWordDigitValidation,
        saveButtonValidation: saveValidation,
      ));
    });

    on<SaveEdit>(
      (event, emit) async {
        final isEmailValid = ValidationUtils.isValidEmail(event.email);
        final isPassword = ValidationUtils.isValidPassword(event.password);

        if (event.email.isNullOrEmpty()) {
          emailValidation = ValidationEnum.empty;
        } else if (!isEmailValid) {
          emailValidation = ValidationEnum.invalid;
        } else {
          emailValidation = ValidationEnum.valid;
        }

        if (event.phoneNumber.isNullOrEmpty()) {
          phoneNumberValidation = ValidationEnum.empty;
        } else if (event.phoneNumber.length != 10) {
          phoneNumberValidation = ValidationEnum.invalid;
        } else {
          phoneNumberValidation = ValidationEnum.valid;
        }

        if (event.currentPassword.isNotNullOrEmpty()) {
          if (event.currentPassword.isEmpty) {
            currentPasswordValidation = ValidationEnum.empty;
          }else{
            currentPasswordValidation = ValidationEnum.valid;
          }

          if (event.password.isNullOrEmpty()) {
            passwordValidation = ValidationEnum.empty;
          } else if (!isPassword) {
            passwordValidation = ValidationEnum.invalid;
          } else {
            passwordValidation = ValidationEnum.valid;
          }

          if (event.confirmPassword.isNullOrEmpty()) {
            confirmPasswordValidation = ValidationEnum.empty;
          } else if (event.password != event.confirmPassword) {
            confirmPasswordValidation = ValidationEnum.invalid;
          } else {
            confirmPasswordValidation = ValidationEnum.valid;
          }

          if (!isPassword) {
            if (ValidationUtils.isValidPasswordCharacter(event.password)) {
              passwordCharacterValidation = ValidationValidInvalid.valid;
            } else {
              passwordCharacterValidation = ValidationValidInvalid.invalid;
            }

            if (ValidationUtils.isValidPasswordLeastCharacters(event.password)) {
              passwordLeastCharactersValidation = ValidationValidInvalid.valid;
            } else {
              passwordLeastCharactersValidation = ValidationValidInvalid.invalid;
            }

            if (ValidationUtils.isValidPasswordLowerPpper(event.password)) {
              passwordLowerUpperValidation = ValidationValidInvalid.valid;
            } else {
              passwordLowerUpperValidation = ValidationValidInvalid.invalid;
            }

            if (ValidationUtils.isValidPasswordWordDigit(event.password)) {
              passwordWordDigitValidation = ValidationValidInvalid.valid;
            } else {
              passwordWordDigitValidation = ValidationValidInvalid.invalid;
            }
          }
        } else {
          passwordValidation = ValidationEnum.valid;
          confirmPasswordValidation = ValidationEnum.valid;
          currentPasswordValidation = ValidationEnum.valid;
          passwordCharacterValidation = ValidationValidInvalid.valid;
          passwordLeastCharactersValidation = ValidationValidInvalid.valid;
          passwordLowerUpperValidation = ValidationValidInvalid.valid;
          passwordWordDigitValidation = ValidationValidInvalid.valid;
        }

        emit(
          EditProfileState.validation(
            email: emailValidation,
            password: passwordValidation,
            confirmPasswordValidation: confirmPasswordValidation,
            currentPasswordValidation: currentPasswordValidation,
            phoneNumberValidation: phoneNumberValidation,
            passwordCharacterValidation: passwordCharacterValidation,
            passwordLeastCharactersValidation: passwordLeastCharactersValidation,
            passwordLowerUpperValidation: passwordLowerUpperValidation,
            passwordWordDigitValidation: passwordWordDigitValidation,
            saveButtonValidation: saveValidation,
          ),
        );

        if (emailValidation != ValidationEnum.valid ||
            phoneNumberValidation != ValidationEnum.valid ||
            passwordValidation != ValidationEnum.valid ||
            confirmPasswordValidation != ValidationEnum.valid ||
            currentPasswordValidation != ValidationEnum.valid) return;

        emit(const EditProfileState.loading());

        final response = await editUserUseCase(
          EditUserModel(
            userId: PreferencesManager.user?.uid,
            email: event.email.nullIfEmpty,
            password: event.password.nullIfEmpty,
            userPhoneNumber: event.phoneNumber.nullIfEmpty,
          ),
        );

        response.when(
          success: (data) => emit(EditProfileState.success(user: data?.result)),
          error: (msg) => emit(EditProfileState.error(msg: msg)),
        );
      },
    );
  }

  ValidationEnum emailValidation = ValidationEnum.none;
  ValidationEnum phoneNumberValidation = ValidationEnum.none;
  ValidationEnum passwordValidation = ValidationEnum.valid;
  ValidationEnum confirmPasswordValidation = ValidationEnum.valid;
  ValidationEnum currentPasswordValidation = ValidationEnum.valid;
  ValidationValidInvalid passwordCharacterValidation = ValidationValidInvalid.valid;
  ValidationValidInvalid passwordLeastCharactersValidation = ValidationValidInvalid.valid;
  ValidationValidInvalid passwordLowerUpperValidation = ValidationValidInvalid.valid;
  ValidationValidInvalid passwordWordDigitValidation = ValidationValidInvalid.valid;

  ValidationValidInvalid saveValidation = ValidationValidInvalid.invalid;

  final EditUserUseCase editUserUseCase;

  void validSaveButton() {
    if (emailValidation != ValidationEnum.empty &&
        phoneNumberValidation != ValidationEnum.empty &&
        currentPasswordValidation != ValidationEnum.empty &&
        passwordValidation != ValidationEnum.empty &&
        confirmPasswordValidation != ValidationEnum.empty) {
      saveValidation = ValidationValidInvalid.valid;
    } else {
      saveValidation = ValidationValidInvalid.invalid;
    }
  }
}
