import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_promos_event.freezed.dart';

@freezed
class StorePromosEvent with _$StorePromosEvent {
  const factory StorePromosEvent.getPromos(String? storeId) = GetPromos;
}