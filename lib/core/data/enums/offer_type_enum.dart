import 'package:json_annotation/json_annotation.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';

enum OfferTypeEnum {
  @JsonValue('available')
  available,
  @JsonValue('redeemed')
  redeemed,
  @JsonValue('selected')
  selected,
  @JsonValue('expired')
  expired;

  String get icon {
    switch (this) {
      case OfferTypeEnum.available:
        return AppAssets.clipIcon;
      case OfferTypeEnum.redeemed:
        return AppAssets.clippedRedeemed;
      case OfferTypeEnum.selected:
        return AppAssets.clipped;
      case OfferTypeEnum.expired:
        return AppAssets.clippedExpired;
    }
  }
}
