import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/enums/validation_valid_invalid.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';

part 'sign_up_state.freezed.dart';

@Freezed(equal: false)
class SignUpState with _$SignUpState {
  const factory SignUpState.loading() = _$SignUpStateLoading;

  const factory SignUpState.success(UserModel? user) = _$SignUpStateSuccess;

  const factory SignUpState.error({
    required String msg,
  }) = _$SignUpStateError;

  const factory SignUpState.logout({
    required String msg,
    required String errorCode,
  }) = _$SignUpStateLogout;

  const factory SignUpState.validation({
    required ValidationEnum email,
    required ValidationEnum phoneNumberValidation,
    required ValidationEnum confirmPasswordValidation,
    required ValidationEnum password,
    required ValidationValidInvalid passwordCharacterValidation,
    required ValidationValidInvalid passwordLowerUpperValidation,
    required ValidationValidInvalid passwordLeastCharactersValidation,
    required ValidationValidInvalid passwordWordDigitValidation,
    required ValidationEnum preferredValidation,
    required bool isButtonActive,
    required StoreModel? store,
  }) = _$SignInStateValidation;
}

extension SignUpStateExt on SignUpState {
  bool buildWhen() => when(
        loading: () => false,
        success: (_) => false,
        error: (_) => false,
        validation: (
          _,
          __,
          ___,
          ____,
          _____,
          ______,
          _______,
          ________,
          _________,
          __________,
          ___________,
        ) =>
            true,
        logout: (String msg, String errorCode) => false,
      );

  bool listenWhen() => !buildWhen();
}
