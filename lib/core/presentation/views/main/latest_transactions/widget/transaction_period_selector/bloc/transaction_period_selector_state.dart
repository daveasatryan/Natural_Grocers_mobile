import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/single_character_radio.dart';

part 'transaction_period_selector_state.freezed.dart';

@freezed
class TransactionPeriodSelectorState with _$TransactionPeriodSelectorState {
  const factory TransactionPeriodSelectorState.loading() = _$TransactionPeriodSelectorStateLoading;

  const factory TransactionPeriodSelectorState.success() = _$TransactionPeriodSelectorStateSuccess;

  const factory TransactionPeriodSelectorState.error({
    required String msg,
    required String errorCode,
  }) = _$TransactionPeriodSelectorStateError;

  const factory TransactionPeriodSelectorState.initialRadio({
    required SingingCharacterRadio character,
    required bool dateShow,
    String? startDate,
    String? endDate,
  }) = _$TransactionPeriodSelectorStateInitialRadio;
}

extension TransactionPeriodSelectorStateExt on TransactionPeriodSelectorState {
  bool buildWhen() => when(
        loading: () => false,
        success: () => true,
        error: (_, __) => false,
        initialRadio: (_, __, ___, ____) => true,
      );

  bool listenWhen() => !buildWhen();
}
