import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_details_event.freezed.dart';

@freezed
class StoreDetailsEvent with _$StoreDetailsEvent {
  const factory StoreDetailsEvent.setAsPreferredStore(String nid) = SetAsPreferredStore;
}
