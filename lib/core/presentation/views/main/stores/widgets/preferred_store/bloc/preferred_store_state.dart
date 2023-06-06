import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferred_store_state.freezed.dart';

@freezed
class PreferredStoreState with _$PreferredStoreState {
  const factory PreferredStoreState.loading() = _$PreferredStoreStateLoading;

  const factory PreferredStoreState.success() = _$PreferredStoreStateSuccess;

  const factory PreferredStoreState.error({
    required String msg,
    required String errorCode,
  }) = _$PreferredStoreStateError;

  const factory PreferredStoreState.logout({
    required String msg,
    required String errorCode,
  }) = _$PreferredStoreStateLogout;
}

extension PreferredStoreStateExt on PreferredStoreState {
  bool buildWhen() => when(
        loading: () => false,
        success: () => true,
        error: (_, __) => false,
        logout: (_, __) => false,
      );

  bool listenWhen() => !buildWhen();
}
