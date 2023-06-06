import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.loading() = _$OnboardingStateLoading;

  const factory OnboardingState.success() = _$OnboardingStateSuccess;

  const factory OnboardingState.error({
    required String msg,
    required String errorCode,
  }) = _$OnboardingStateError;

  const factory OnboardingState.pages({
    required int index,
    int? indexPage,
  }) = _$OnboardingStatePages;
}

extension OnboardingStateExt on OnboardingState {
  bool buildWhen() => when(
        loading: () => false,
        success: () => false,
        error: (_, __) => false,
        pages: (_, __) => true,
      );

  bool listenWhen() => !buildWhen();
}
