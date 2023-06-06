import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/n_power_faqs_enum.dart';
import 'package:natural_groceries/core/data/models/faqs/faqs_model.dart';

part 'n_power_faqs_state.freezed.dart';

@freezed
class NPowerFaqsState with _$NPowerFaqsState {
  const factory NPowerFaqsState.initial({
    required NPowerFaqsEnum nPowerFaqsEnum,
    required FaqsModel? faqs,
  }) = _$NPowerFaqsStateInitial;

  const factory NPowerFaqsState.loading() = _$NPowerFaqsStateLoading;

  const factory NPowerFaqsState.error(String msg) = _$NPowerFaqsStateError;
}


extension NPowerFaqsStateExt on NPowerFaqsState {
  bool buildWhen() => when(
    initial: (_, __) => true,
    loading: () => true,
    error: (_) => false,
  );

  bool listenWhen() => !buildWhen();
}
