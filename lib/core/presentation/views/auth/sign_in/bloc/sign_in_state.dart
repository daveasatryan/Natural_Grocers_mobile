import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';

part 'sign_in_state.freezed.dart';

@Freezed(equal: false)
class SignInState with _$SignInState {
  const factory SignInState.loading() = _$SignInStateLoading;

  const factory SignInState.success(UserModel? user) = _$SignInStateSuccess;

  const factory SignInState.error({
    required String msg,
  }) = _$SignInStateError;

  const factory SignInState.validation({
    required ValidationEnum email,
    required ValidationEnum password,
  }) = _$SignInStateValidationEmailPassword;
}

extension SignInStateExt on SignInState {
  bool buildWhen() => when(
        loading: () => false,
        success: (_) => false,
        error: (_) => false,
        validation: (_, __) => true,
      );

  bool listenWhen() => !buildWhen();
}
