import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_preferred_store_event.freezed.dart';

@freezed
class MyPreferredStoreEvent with _$MyPreferredStoreEvent {
  const factory MyPreferredStoreEvent.getStores() = GetStores;
}
