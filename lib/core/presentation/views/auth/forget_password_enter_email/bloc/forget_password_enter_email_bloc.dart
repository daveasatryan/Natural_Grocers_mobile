import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/enums/validation_valid_invalid.dart';
import 'package:natural_groceries/core/data/validation_utils.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password_enter_email/bloc/forget_password_enter_email_event.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password_enter_email/bloc/forget_password_enter_email_state.dart';

@injectable
class ForgetPasswordEnterEmailBloc
    extends Bloc<ForgetPasswordEnterEmailEvent, ForgetPasswordEnterEmailState> {
  ForgetPasswordEnterEmailBloc()
      : super(const ForgetPasswordEnterEmailState.enterEmail(
          email: ValidationEnum.none,
          emailEnterButton: ValidationValidInvalid.invalid,
        )) {
    on<ValidateEnterEmail>((event, emit) {
      emailValidation = ValidationEnum.none;

      if (event.email.isNotEmpty) {
        enterEmailButtonValidation = ValidationValidInvalid.valid;
      } else {
        enterEmailButtonValidation = ValidationValidInvalid.invalid;
      }

      emit(
        ForgetPasswordEnterEmailState.enterEmail(
          email: emailValidation,
          emailEnterButton: enterEmailButtonValidation,
        ),
      );
    });

    on<ForgetEnterEmailButton>((event, emit) async {
      final isEmailValid = ValidationUtils.isValidEmail(event.email);

      if (!isEmailValid) {
        emailValidation = ValidationEnum.invalid;
      }

      if (isEmailValid) {
        emailValidation = ValidationEnum.valid;
      }

      if (event.email.isEmpty) {
        emailValidation = ValidationEnum.empty;
      }

      if (emailValidation != ValidationEnum.valid) {
        emit(ForgetPasswordEnterEmailState.enterEmail(
            email: emailValidation, emailEnterButton: enterEmailButtonValidation));
        return;
      }
      emit(const ForgetPasswordEnterEmailState.success());
    });
  }

  ValidationEnum emailValidation = ValidationEnum.none;
  ValidationValidInvalid enterEmailButtonValidation = ValidationValidInvalid.invalid;
}
