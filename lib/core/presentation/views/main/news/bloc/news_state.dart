import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.loading() = _$NewsStateLoading;

  const factory NewsState.success() = _$NewsStateSuccess;

  const factory NewsState.error({
    required String msg,
    required String errorCode,
  }) = _$NewsStateError;

  const factory NewsState.logout({
    required String msg,
    required String errorCode,
  }) = _$NewsStateLogout;
}

extension NewsStateExt on NewsState {
  bool buildWhen() => when(
        loading: () => false,
        success: () => true,
        error: (_, __) => false,
        logout: (_, __) => false,
      );

  bool listenWhen() => !buildWhen();
}
