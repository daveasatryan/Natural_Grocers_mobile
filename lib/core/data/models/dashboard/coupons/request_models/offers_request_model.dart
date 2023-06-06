import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/offer_type_enum.dart';

part 'offers_request_model.freezed.dart';

part 'offers_request_model.g.dart';

@freezed
class OffersRequestModel with _$OffersRequestModel {
  const factory OffersRequestModel({
    @Default(OfferTypeEnum.available)
    @JsonKey(name: 'offerType')
        OfferTypeEnum offerType,
  }) = _OffersRequestModel;

  factory OffersRequestModel.fromJson(Map<String, Object?> json) =>
      _$OffersRequestModelFromJson(json);
}
