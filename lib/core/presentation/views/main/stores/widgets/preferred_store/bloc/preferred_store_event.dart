import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferred_store_event.freezed.dart';

@freezed
class PreferredStoreEvent with _$PreferredStoreEvent {
  const factory PreferredStoreEvent.getPreferredStore() = GetPreferredStore;
}
