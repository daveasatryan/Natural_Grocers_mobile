import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/models/auth/sign_in_model.dart';
import 'package:natural_groceries/core/data/usecases/auth/sign_in_usecase.dart';
import 'package:natural_groceries/core/data/validation_utils.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_in/bloc/sign_in_event.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_in/bloc/sign_in_state.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this._signInUsecase)
      : super(
          const SignInState.validation(
            email: ValidationEnum.none,
            password: ValidationEnum.none,
          ),
        ) {
    on<ValidateEmail>(
      (event, emit) {
        emailValidation = ValidationEnum.none;

        emit(
          SignInState.validation(
            email: emailValidation,
            password: passwordValidation,
          ),
        );
      },
    );

    on<ValidatePassword>(
      (event, emit) {
        passwordValidation = ValidationEnum.none;

        emit(
          SignInState.validation(
            email: emailValidation,
            password: passwordValidation,
          ),
        );
      },
    );

    on<SignIn>(
      (event, emit) async {
        final isEmailValid = ValidationUtils.isValidEmail(event.email);

        if (!isEmailValid) {
          emailValidation = ValidationEnum.invalid;
        } else {
          emailValidation = ValidationEnum.valid;
        }

        if (event.email.isEmpty) {
          emailValidation = ValidationEnum.empty;
        }

        if (event.password.isEmpty) {
          passwordValidation = ValidationEnum.empty;
        }

        if (emailValidation != ValidationEnum.valid || passwordValidation != ValidationEnum.none) {
          emit(
            SignInState.validation(
              email: emailValidation,
              password: passwordValidation,
            ),
          );
          return;
        }
        emit(const SignInState.loading());

        final response = await _signInUsecase(
          SignInModel(
            userName: event.email,
            password: event.password,
          ),
        );

        response.when(
            success: (data) => emit(SignInState.success(data?.result)),
            error: (msg) => emit(SignInState.error(msg: msg)));
      },
    );
  }

  ValidationEnum emailValidation = ValidationEnum.none;
  ValidationEnum passwordValidation = ValidationEnum.none;

  final SignInUsecase _signInUsecase;
}
