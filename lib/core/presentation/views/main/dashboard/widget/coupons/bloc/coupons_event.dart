import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/offer_type_enum.dart';

part 'coupons_event.freezed.dart';

@freezed
class CouponsEvent with _$CouponsEvent {
  const factory CouponsEvent.getCoupons(OfferTypeEnum type) = GetCoupons;
}