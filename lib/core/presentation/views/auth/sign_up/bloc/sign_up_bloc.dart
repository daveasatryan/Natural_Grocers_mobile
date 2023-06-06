import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/enums/validation_valid_invalid.dart';
import 'package:natural_groceries/core/data/models/auth/sign_up_model.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/usecases/auth/create_user_usecase.dart';
import 'package:natural_groceries/core/data/validation_utils.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_up/bloc/sign_up_event.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_up/bloc/sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this._createUserUsecase)
      : super(
          const SignUpState.validation(
            email: ValidationEnum.none,
            password: ValidationEnum.none,
            confirmPasswordValidation: ValidationEnum.none,
            phoneNumberValidation: ValidationEnum.none,
            passwordCharacterValidation: ValidationValidInvalid.valid,
            passwordLeastCharactersValidation: ValidationValidInvalid.valid,
            passwordLowerUpperValidation: ValidationValidInvalid.valid,
            passwordWordDigitValidation: ValidationValidInvalid.valid,
            preferredValidation: ValidationEnum.none,
            isButtonActive: false,
            store: null,
          ),
        ) {
    on<ValidateEmail>(
      (event, emit) {
        emailValidation = ValidationEnum.none;
        emit(
          SignUpState.validation(
            email: emailValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPasswordValidation: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumberValidation: phoneNumberValidation ?? ValidationEnum.none,
            passwordCharacterValidation: passwordCharacterValidation,
            passwordLeastCharactersValidation: passwordLeastCharactersValidation,
            passwordLowerUpperValidation: passwordLowerUpperValidation,
            passwordWordDigitValidation: passwordWordDigitValidation,
            preferredValidation: preferredValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
            store: preferredStore,
          ),
        );
      },
    );

    on<ValidatePhoneNumber>(
      (event, emit) {
        phoneNumberValidation = ValidationEnum.none;
        emit(
          SignUpState.validation(
            email: emailValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPasswordValidation: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumberValidation: phoneNumberValidation ?? ValidationEnum.none,
            passwordCharacterValidation: passwordCharacterValidation,
            passwordLeastCharactersValidation: passwordLeastCharactersValidation,
            passwordLowerUpperValidation: passwordLowerUpperValidation,
            passwordWordDigitValidation: passwordWordDigitValidation,
            preferredValidation: preferredValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
            store: preferredStore,
          ),
        );
      },
    );

    on<ValidatePassword>(
      (event, emit) {
        passwordValidation = ValidationEnum.none;
        emit(
          SignUpState.validation(
            email: emailValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPasswordValidation: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumberValidation: phoneNumberValidation ?? ValidationEnum.none,
            passwordCharacterValidation: passwordCharacterValidation,
            passwordLeastCharactersValidation: passwordLeastCharactersValidation,
            passwordLowerUpperValidation: passwordLowerUpperValidation,
            passwordWordDigitValidation: passwordWordDigitValidation,
            preferredValidation: preferredValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
            store: preferredStore,
          ),
        );
      },
    );

    on<ValidateConfirmePassword>(
      (event, emit) {
        confirmPasswordValidation = ValidationEnum.none;
        emit(
          SignUpState.validation(
            email: emailValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPasswordValidation: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumberValidation: phoneNumberValidation ?? ValidationEnum.none,
            passwordCharacterValidation: passwordCharacterValidation,
            passwordLeastCharactersValidation: passwordLeastCharactersValidation,
            passwordLowerUpperValidation: passwordLowerUpperValidation,
            passwordWordDigitValidation: passwordWordDigitValidation,
            preferredValidation: preferredValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
            store: preferredStore,
          ),
        );
      },
    );

    on<SignUp>(
      (event, emit) async {
        final isEmailValid = ValidationUtils.isValidEmail(event.email);
        final isPassword = ValidationUtils.isValidPassword(event.password);

        if (event.email.isEmpty) {
          emailValidation = ValidationEnum.empty;
        } else if (!isEmailValid) {
          emailValidation = ValidationEnum.invalid;
        } else {
          emailValidation = ValidationEnum.valid;
        }

        if (event.phoneNumber.isEmpty) {
          phoneNumberValidation = ValidationEnum.empty;
        } else if (event.phoneNumber.length != 10) {
          phoneNumberValidation = ValidationEnum.invalid;
        } else {
          phoneNumberValidation = ValidationEnum.valid;
        }

        if (event.password.isEmpty) {
          passwordValidation = ValidationEnum.empty;
        } else if (!isPassword) {
          passwordValidation = ValidationEnum.invalid;
        } else {
          passwordValidation = ValidationEnum.valid;
        }

        if (event.confirmPassword.isEmpty) {
          confirmPasswordValidation = ValidationEnum.empty;
        } else if (event.password != event.confirmPassword) {
          confirmPasswordValidation = ValidationEnum.invalid;
        } else {
          confirmPasswordValidation = ValidationEnum.valid;
        }

        if (preferredStore != null) {
          preferredValidation = ValidationEnum.valid;
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
        emit(
          SignUpState.validation(
            email: emailValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPasswordValidation: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumberValidation: phoneNumberValidation ?? ValidationEnum.none,
            passwordCharacterValidation: passwordCharacterValidation,
            passwordLeastCharactersValidation: passwordLeastCharactersValidation,
            passwordLowerUpperValidation: passwordLowerUpperValidation,
            passwordWordDigitValidation: passwordWordDigitValidation,
            preferredValidation: preferredValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
            store: preferredStore,
          ),
        );
        if (emailValidation != ValidationEnum.valid ||
            phoneNumberValidation != ValidationEnum.valid ||
            passwordValidation != ValidationEnum.valid ||
            confirmPasswordValidation != ValidationEnum.valid ||
            preferredValidation != ValidationEnum.valid) return;

        emit(const SignUpState.loading());
        final response = await _createUserUsecase(
          SignUpModel(
            email: event.email,
            password: event.password,
            passwordConfirm: event.confirmPassword,
            userPhoneNumber: event.phoneNumber,
            preferredStore: '1456', // preferredStore?.nid,
          ),
        );

        response.when(
          success: (data) => emit(SignUpState.success(data?.result)),
          error: (msg) => emit(SignUpState.error(msg: msg)),
        );
      },
    );

    on<SetPreferredStore>(
      (event, emit) {
        preferredValidation = ValidationEnum.none;
        preferredStore = event.store;
        emit(
          SignUpState.validation(
            email: emailValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPasswordValidation: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumberValidation: phoneNumberValidation ?? ValidationEnum.none,
            passwordCharacterValidation: passwordCharacterValidation,
            passwordLeastCharactersValidation: passwordLeastCharactersValidation,
            passwordLowerUpperValidation: passwordLowerUpperValidation,
            passwordWordDigitValidation: passwordWordDigitValidation,
            preferredValidation: preferredValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
            store: preferredStore,
          ),
        );
      },
    );
  }

  ValidationEnum? emailValidation;
  ValidationEnum? phoneNumberValidation;
  ValidationEnum? passwordValidation;
  ValidationEnum? confirmPasswordValidation;
  ValidationEnum? preferredValidation;

  ValidationValidInvalid passwordCharacterValidation = ValidationValidInvalid.valid;
  ValidationValidInvalid passwordLeastCharactersValidation = ValidationValidInvalid.valid;
  ValidationValidInvalid passwordLowerUpperValidation = ValidationValidInvalid.valid;
  ValidationValidInvalid passwordWordDigitValidation = ValidationValidInvalid.valid;

  bool get isButtonActive =>
      (emailValidation == ValidationEnum.none || emailValidation == ValidationEnum.valid) &&
      (phoneNumberValidation == ValidationEnum.none ||
          phoneNumberValidation == ValidationEnum.valid) &&
      (passwordValidation == ValidationEnum.none || passwordValidation == ValidationEnum.valid) &&
      (confirmPasswordValidation == ValidationEnum.none ||
          confirmPasswordValidation == ValidationEnum.valid) &&
      (preferredValidation == ValidationEnum.none || preferredValidation == ValidationEnum.valid);

  final CreateUserUsecase _createUserUsecase;
  StoreModel? preferredStore;
}
