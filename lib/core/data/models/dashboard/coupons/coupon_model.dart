import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/dashboard/coupons/offer_status_model.dart';
import 'package:natural_groceries/core/data/models/dashboard/coupons/order_total_parameter_model.dart';
import 'package:natural_groceries/core/data/models/dashboard/coupons/upc_groups_model.dart';

part 'coupon_model.freezed.dart';

part 'coupon_model.g.dart';

@freezed
class CouponModel with _$CouponModel {
  const factory CouponModel({
    @JsonKey(name: 'issuer') String? issuer,
    @JsonKey(name: 'inmarID') int? inmarID,
    @JsonKey(name: 'issuerCode') int? issuerCode,
    @JsonKey(name: 'offerCode') int? offerCode,
    @JsonKey(name: 'activeDate') String? activeDate,
    @JsonKey(name: 'expirationDate') String? expirationDate,
    @JsonKey(name: 'clipStartDate') String? clipStartDate,
    @JsonKey(name: 'clipEndDate') String? clipEndDate,
    @JsonKey(name: 'fundingType') int? fundingType,
    @JsonKey(name: 'clipType') String? clipType,
    @JsonKey(name: 'program') String? program,
    @JsonKey(name: 'brand') String? brand,
    @JsonKey(name: 'offerType') String? offerType,
    @JsonKey(name: 'offerValue') int? offerValue,
    @JsonKey(name: 'offerValueType') int? offerValueType,
    @JsonKey(name: 'upcaCode') String? upcaCode,
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'dateSelected') List<String>? dateSelected,
    @JsonKey(name: 'dateRedeemed') String? dateRedeemed,
    @JsonKey(name: 'shortDescription') String? shortDescription,
    @JsonKey(name: 'offerDescription') String? offerDescription,
    @JsonKey(name: 'detailLink') String? detailLink,
    @JsonKey(name: 'imageURL') String? imageURL,
    @JsonKey(name: 'daysOfWeek') String? daysOfWeek,
    @JsonKey(name: 'times') String? times,
    @JsonKey(name: 'offerStatus') OfferStatusModel? offerStatus,
    @JsonKey(name: 'validatingUPCs') UpcGroupsModel? validatingUPCs,
    @JsonKey(name: 'rank') int? rank,
    @JsonKey(name: 'orderTotalParameters') OrderTotalParameterModel? orderTotalParameters,
    @JsonKey(name: 'terms') String? terms,
    @JsonKey(name: 'maxValue') String? maxValue,
    @JsonKey(name: 'maxClipCount') int? maxClipCount,
    @JsonKey(name: 'buyQuantity') int? buyQuantity,
    @JsonKey(name: 'customerService') String? customerService,
    @JsonKey(name: 'maxTransactionRedeemCount') String? maxTransactionRedeemCount,
    @JsonKey(name: 'getQuantity') String? getQuantity,
    @JsonKey(name: 'displayDateName') String? displayDateName,
    @JsonKey(name: 'displayDateValue') String? displayDateValue,
    @JsonKey(name: 'newCoupon') bool? newCoupon,
    @JsonKey(name: 'offerDisplayValue') String? offerDisplayValue,
    @JsonKey(name: 'rewardId') String? rewardId,
    @JsonKey(name: 'sortOfferValue') double? sortOfferValue,
    @JsonKey(name: 'rewardIsGiftcard') bool? rewardIsGiftcard,
    @JsonKey(name: 'keywords') String? keywords,
    @JsonKey(name: 'displayExpirationDate') String? displayExpirationDate,
    @JsonKey(name: 'displayActiveDate') String? displayActiveDate,
    @JsonKey(name: 'displayDateRedeemed') String? displayDateRedeemed,
    @JsonKey(name: 'validatingUPCGroups') UpcGroupsModel? validatingUPCGroups,
  }) = _CouponModel;

  factory CouponModel.fromJson(Map<String, Object?> json) => _$CouponModelFromJson(json);
}
