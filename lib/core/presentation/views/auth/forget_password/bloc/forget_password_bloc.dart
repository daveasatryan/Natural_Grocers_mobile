import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/enums/validation_valid_invalid.dart';
import 'package:natural_groceries/core/data/validation_utils.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password/bloc/forget_password_event.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password/bloc/forget_password_state.dart';

@injectable
class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc()
      : super(const ForgetPasswordState.validation(
          email: ValidationEnum.none,
          password: ValidationEnum.none,
          confirmPasswordValidation: ValidationEnum.none,
          passwordCharacterValidation: ValidationValidInvalid.valid,
          passwordLeastCharactersValidation: ValidationValidInvalid.valid,
          passwordLowerUpperValidation: ValidationValidInvalid.valid,
          passwordWordDigitValidation: ValidationValidInvalid.valid,
          forgetPasswordButton: ValidationValidInvalid.invalid,
        )) {
    on<ValidateNewPassword>((event, emit) {
      passwordValidation = ValidationEnum.none;

      if (event.email.isNotEmpty && event.password.isNotEmpty && event.confirmPassword.isNotEmpty) {
        forgetPasswordButtonValidation = ValidationValidInvalid.valid;
      } else {
        forgetPasswordButtonValidation = ValidationValidInvalid.invalid;
      }

      emit(ForgetPasswordState.validation(
        email: emailValidation,
        password: passwordValidation,
        confirmPasswordValidation: confirmPasswordValidation,
        passwordCharacterValidation: passwordCharacterValidation,
        passwordLeastCharactersValidation: passwordLeastCharactersValidation,
        passwordLowerUpperValidation: passwordLowerUpperValidation,
        passwordWordDigitValidation: passwordWordDigitValidation,
        forgetPasswordButton: forgetPasswordButtonValidation,
      ));
    });

    on<ValidateNewConfirmePassword>((event, emit) {
      confirmPasswordValidation = ValidationEnum.none;
      if (event.email.isNotEmpty && event.password.isNotEmpty && event.confirmPassword.isNotEmpty) {
        forgetPasswordButtonValidation = ValidationValidInvalid.valid;
      } else {
        forgetPasswordButtonValidation = ValidationValidInvalid.invalid;
      }

      emit(ForgetPasswordState.validation(
        email: emailValidation,
        password: passwordValidation,
        confirmPasswordValidation: confirmPasswordValidation,
        passwordCharacterValidation: passwordCharacterValidation,
        passwordLeastCharactersValidation: passwordLeastCharactersValidation,
        passwordLowerUpperValidation: passwordLowerUpperValidation,
        passwordWordDigitValidation: passwordWordDigitValidation,
        forgetPasswordButton: forgetPasswordButtonValidation,
      ));
    });

    on<ForgetPasswordButton>((event, emit) async {
      final isPassword = ValidationUtils.isValidPassword(event.password);
      final isEmail = ValidationUtils.isValidEmail(event.email);
      if (!isEmail) {
        emailValidation = ValidationEnum.invalid;
      }
      if (isEmail) {
        emailValidation = ValidationEnum.valid;
      }
      if (event.email.isEmpty) {
        emailValidation = ValidationEnum.empty;
      }
      if (event.password.isEmpty) {
        passwordValidation = ValidationEnum.empty;
      }
      if (!isPassword) {
        passwordValidation = ValidationEnum.invalid;
      }
      if (isPassword) {
        passwordValidation = ValidationEnum.valid;
      }
      if (event.confirmPassword.isEmpty) {
        confirmPasswordValidation = ValidationEnum.empty;
      }
      if (event.password != event.confirmPassword || event.confirmPassword.isEmpty) {
        confirmPasswordValidation = ValidationEnum.invalid;
      } else {
        confirmPasswordValidation = ValidationEnum.valid;
      }

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
      if (emailValidation != ValidationEnum.valid ||
          passwordValidation != ValidationEnum.valid ||
          confirmPasswordValidation != ValidationEnum.valid) {
        emit(ForgetPasswordState.validation(
          email: emailValidation,
          password: passwordValidation,
          confirmPasswordValidation: confirmPasswordValidation,
          passwordCharacterValidation: passwordCharacterValidation,
          passwordLeastCharactersValidation: passwordLeastCharactersValidation,
          passwordLowerUpperValidation: passwordLowerUpperValidation,
          passwordWordDigitValidation: passwordWordDigitValidation,
          forgetPasswordButton: forgetPasswordButtonValidation,
        ));
        return;
      }

      emit(const ForgetPasswordState.loading());
      await Future.delayed(const Duration(milliseconds: 500));
      emit(const ForgetPasswordState.success());
      return;
    });
  }

  ValidationEnum passwordValidation = ValidationEnum.none;
  ValidationEnum emailValidation = ValidationEnum.none;
  ValidationEnum confirmPasswordValidation = ValidationEnum.none;
  ValidationValidInvalid passwordCharacterValidation = ValidationValidInvalid.valid;
  ValidationValidInvalid passwordLeastCharactersValidation = ValidationValidInvalid.valid;
  ValidationValidInvalid passwordLowerUpperValidation = ValidationValidInvalid.valid;
  ValidationValidInvalid passwordWordDigitValidation = ValidationValidInvalid.valid;
  ValidationValidInvalid forgetPasswordButtonValidation = ValidationValidInvalid.invalid;
}
