import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_time_valid_email_state.freezed.dart';

@freezed
class ForgetPasswordTimeValidEmailState with _$ForgetPasswordTimeValidEmailState {
  const factory ForgetPasswordTimeValidEmailState.loading() =
      _$ForgetPasswordTimeValidEmailStateLoading;

  const factory ForgetPasswordTimeValidEmailState.success() =
      _$ForgetPasswordTimeValidEmailStateSuccess;

  const factory ForgetPasswordTimeValidEmailState.error({
    required String msg,
    required String errorCode,
  }) = _$ForgetPasswordTimeValidEmailStateError;

  const factory ForgetPasswordTimeValidEmailState.logout({
    required String msg,
    required String errorCode,
  }) = _$ForgetPasswordTimeValidEmailStateLogout;

  const factory ForgetPasswordTimeValidEmailState.initial() =
      _$ForgetPasswordTimeValidEmailStateInitial;
}

extension ForgetPasswordTimeValidEmailStateExt on ForgetPasswordTimeValidEmailState {
  bool buildWhen() => when(
        loading: () => false,
        success: () => true,
        error: (_, __) => false,
        logout: (_, __) => false,
        initial: () => true,
      );

  bool listenWhen() => !buildWhen();
}
