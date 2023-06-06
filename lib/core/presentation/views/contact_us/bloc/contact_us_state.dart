import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/contact_us_validation_model.dart';

part 'contact_us_state.freezed.dart';

@freezed
class ContactUsState with _$ContactUsState {

  const factory ContactUsState.initial({
    required ContactUsValidationModel validationModel,
  }) = _$ContactUsStateInitial;

  const factory ContactUsState.loading() = _$ContactUsStateLoading;

  const factory ContactUsState.error(String msg) = _$ContactUsStateError;
}


extension ContactUsStateExt on ContactUsState{
  bool buildWhen() => when(
    initial: (_) => true,
    loading: () => false,
    error: (_) => false,
  );

  bool listenWhen() => !buildWhen();
}
