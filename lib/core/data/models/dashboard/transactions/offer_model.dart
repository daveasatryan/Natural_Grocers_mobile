import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

@freezed
class OfferModel with _$OfferModel {
  const factory OfferModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'shortDescriotion') String? shortDescriotion,
    @JsonKey(name: 'value') int? value,
    @JsonKey(name: 'redeemCount') int? redeemCount,
    @JsonKey(name: 'redeemStatus') String? redeemStatus,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, Object?> json) => _$OfferModelFromJson(json);
}
