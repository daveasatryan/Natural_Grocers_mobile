import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';

enum SocialMediaEnum {
  instagram,
  facebook,
  tiktok,
  twitter,
  youtube;

  Widget get icon {
    switch (this) {
      case SocialMediaEnum.instagram:
        return SvgPicture.asset(AppAssets.instagramIcon);
      case SocialMediaEnum.facebook:
        return SvgPicture.asset(AppAssets.facebookIcon);
      case SocialMediaEnum.tiktok:
        return SvgPicture.asset(AppAssets.tiktokIcon);
      case SocialMediaEnum.twitter:
        return SvgPicture.asset(AppAssets.twitterIcon);
      case SocialMediaEnum.youtube:
        return SvgPicture.asset(AppAssets.youtubeIcon);
    }
  }

  String get url {
    switch (this) {
      case SocialMediaEnum.instagram:
        return AppConstants.instagramUrl;
      case SocialMediaEnum.facebook:
        return AppConstants.facebookUrl;
      case SocialMediaEnum.tiktok:
        return AppConstants.tiktokUrl;
      case SocialMediaEnum.twitter:
        return AppConstants.twitterUrl;
      case SocialMediaEnum.youtube:
        return AppConstants.youtubeUrl;
    }
  }
}
