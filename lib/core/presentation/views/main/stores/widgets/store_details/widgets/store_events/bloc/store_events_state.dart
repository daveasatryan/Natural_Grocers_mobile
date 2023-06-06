import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/store/store_event_model.dart';

part 'store_events_state.freezed.dart';

@freezed
class StoreEventsState with _$StoreEventsState {
  const factory StoreEventsState.loading() = _$StoreEventsStateLoading;

  const factory StoreEventsState.success(List<StoreEventModel> events) = _$StoreEventsStateSuccess;

  const factory StoreEventsState.error(msg) = _$StoreEventsStateError;
}
