import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_status_model.freezed.dart';

part 'offer_status_model.g.dart';

@freezed
class OfferStatusModel with _$OfferStatusModel {
  const factory OfferStatusModel({
    @JsonKey(name: 'issuer') String? issuer,
    @JsonKey(name: 'retailer') String? retailer,
  }) = _OfferStatusModel;

factory OfferStatusModel.fromJson(Map<String, Object?> json) => _$OfferStatusModelFromJson(json);
}
