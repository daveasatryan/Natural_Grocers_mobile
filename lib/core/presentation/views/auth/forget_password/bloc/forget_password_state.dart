import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/enums/validation_valid_invalid.dart';

part 'forget_password_state.freezed.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.loading() = _$ForgetPasswordStateLoading;

  const factory ForgetPasswordState.success() = _$ForgetPasswordStateSuccess;

  const factory ForgetPasswordState.error({
    required String msg,
    required String errorCode,
  }) = _$ForgetPasswordStateError;

  const factory ForgetPasswordState.logout({
    required String msg,
    required String errorCode,
  }) = _$ForgetPasswordStateLogout;

  const factory ForgetPasswordState.validation({
    required ValidationEnum email,
    required ValidationEnum confirmPasswordValidation,
    required ValidationEnum password,
    required ValidationValidInvalid passwordCharacterValidation,
    required ValidationValidInvalid passwordLowerUpperValidation,
    required ValidationValidInvalid passwordLeastCharactersValidation,
    required ValidationValidInvalid passwordWordDigitValidation,
    required ValidationValidInvalid forgetPasswordButton,
  }) = _$ForgetPasswordStateValidation;
}

extension ForgetPasswordStateExt on ForgetPasswordState {
  bool buildWhen() => when(
        loading: () => false,
        success: () => false,
        error: (_, __) => false,
        logout: (_, __) => false,
        validation: (
          _,
          __,
          ___,
          ____,
          _____,
          ______,
          _______,
          ________,
        ) =>
            true,
      );

  bool listenWhen() => !buildWhen();
}
