import 'package:natural_groceries/core/data/enums/offer_type_enum.dart';
import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';

enum ClippedPageType {
  loaded,
  redeemed,
  expired;

  String get title {
    final strings = AppLocale.current;
    switch (this) {
      case ClippedPageType.loaded:
        return strings.loaded;
      case ClippedPageType.redeemed:
        return strings.redeemed;
      case ClippedPageType.expired:
        return strings.expired;
    }
  }

  OfferTypeEnum get offerType {
    switch (this) {
      case ClippedPageType.loaded:
        return OfferTypeEnum.selected;
      case ClippedPageType.redeemed:
        return OfferTypeEnum.redeemed;
      case ClippedPageType.expired:
        return OfferTypeEnum.expired;
    }
  }
}
