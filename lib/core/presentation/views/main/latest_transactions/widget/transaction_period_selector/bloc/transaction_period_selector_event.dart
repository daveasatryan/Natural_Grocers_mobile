import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/single_character_radio.dart';

part 'transaction_period_selector_event.freezed.dart';

@freezed
class TransactionPeriodSelectorEvent with _$TransactionPeriodSelectorEvent {
  const factory TransactionPeriodSelectorEvent.togglePeriod({
    required SingingCharacterRadio character,
    String? startDate,
    String? endDate,
  }) = TogglePeriod;
}
