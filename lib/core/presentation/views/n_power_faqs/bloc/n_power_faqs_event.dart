import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/n_power_faqs_enum.dart';

part 'n_power_faqs_event.freezed.dart';

@freezed
class NPowerFaqsEvent with _$NPowerFaqsEvent {

  const factory NPowerFaqsEvent.getFaqs() = GetFaqs;

  const factory NPowerFaqsEvent.changeTab({
    required NPowerFaqsEnum nPowerFaqsEnum,
  }) = ChangeTab;
}
