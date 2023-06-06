import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/store/front_image_model.dart';
import 'package:natural_groceries/core/data/models/store/google_maps_link_model.dart';

part 'store_promo_model.freezed.dart';

part 'store_promo_model.g.dart';

@freezed
class StorePromoModel with _$StorePromoModel {
  const factory StorePromoModel({
    @JsonKey(name: 'field_image') FrontImageModel? fieldImage,
    @JsonKey(name: 'field_promotion_link') GoogleMapsLinkModel? promotionLink,
  }) = _StorePromoModel;

  factory StorePromoModel.fromJson(Map<String, Object?> json) => _$StorePromoModelFromJson(json);
}

extension StorePromoModelExt on StorePromoModel {
  String get image => fieldImage?.url ?? '';
}
