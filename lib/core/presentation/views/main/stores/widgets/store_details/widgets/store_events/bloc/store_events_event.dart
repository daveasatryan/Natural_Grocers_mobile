import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_events_event.freezed.dart';

@freezed
class StoreEventsEvent with _$StoreEventsEvent {
  const factory StoreEventsEvent.getEvents(String? storeId) = GetEvents;
}
