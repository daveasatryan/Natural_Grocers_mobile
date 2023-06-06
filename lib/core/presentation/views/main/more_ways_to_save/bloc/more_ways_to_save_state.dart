import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/more_ways_to_save/more_ways_to_save_model.dart';

part 'more_ways_to_save_state.freezed.dart';

@freezed
class MoreWaysToSaveState with _$MoreWaysToSaveState {

  const factory MoreWaysToSaveState.loading() = _$MoreWaysToSaveStateLoading;

  const factory MoreWaysToSaveState.success({
    required List<MoreWaysToSaveModel> moreWaysToSaveList,
  }) = _$MoreWaysToSaveStateSuccess;

  const factory MoreWaysToSaveState.error(String msg) = _$MoreWaysToSaveStateError;
}


extension MoreWaysToSaveStateExt on MoreWaysToSaveState{
  bool buildWhen() => when(
    success: (_) => true,
    loading: () => false,
    error: (_) => false,
  );

  bool listenWhen() => !buildWhen();
}