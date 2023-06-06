import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/enums/validation_valid_invalid.dart';
import 'package:natural_groceries/core/data/validation_utils.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password_time_invalid_email/bloc/forget_password_time_invalid_email_event.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password_time_invalid_email/bloc/forget_password_time_invalid_email_state.dart';

@injectable
class ForgetPasswordTimeInvalidEmailBloc
    extends Bloc<ForgetPasswordTimeInvalidEmailEvent, ForgetPasswordTimeInvalidEmailState> {
  ForgetPasswordTimeInvalidEmailBloc()
      : super(const ForgetPasswordTimeInvalidEmailState.validation(
            email: ValidationEnum.none, button: ValidationValidInvalid.invalid)) {
    on<ValidateTimeInvalidEmail>((event, emit) {
      emailValidation = ValidationEnum.none;

      if (event.email.isNotEmpty) {
        enterEmailButtonValidation = ValidationValidInvalid.valid;
      } else {
        enterEmailButtonValidation = ValidationValidInvalid.invalid;
      }

      emit(
        ForgetPasswordTimeInvalidEmailState.validation(
          email: emailValidation,
          button: enterEmailButtonValidation,
        ),
      );
    });

    on<ValidateTimeInvalidSubmit>((event, emit) async {
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
        emit(ForgetPasswordTimeInvalidEmailState.validation(
            email: emailValidation, button: enterEmailButtonValidation));
        return;
      }
      emit(const ForgetPasswordTimeInvalidEmailState.success());
    });
  }

  ValidationEnum emailValidation = ValidationEnum.none;
  ValidationValidInvalid enterEmailButtonValidation = ValidationValidInvalid.invalid;
}
