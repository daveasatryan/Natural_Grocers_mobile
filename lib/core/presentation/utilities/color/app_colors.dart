import 'package:flutter/material.dart';

class AppColors {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return whiteColor;
    }
    return greenScreenColor;
  }

  Color get transparent => const Color(0x00FFFFFF);

  Color get greenScreenColor => const Color(0xFF459B4F);

  Color get greenAmountColor => const Color(0xFF37A374);

  Color get borderTrueColor => const Color(0xFF57315E);

  Color get greenBorderColor => const Color(0xFFABBE50);

  Color get mainAppColor => purple;

  Color get mainAppColor60 => purple.withOpacity(.5);

  Color get appSecondaryColor => const Color(0xFFD9D9D9);

  Color get barrierColor => const Color(0x66000000);

  Color get black => const Color(0xFF000000);

  Color get whiteColor => const Color(0xFFFFFFFF);

  Color get whisperColor => const Color(0xFFA3A1A0);

  Color get black45Color => const Color(0xFF4D4945);

  Color get yellowColor => const Color(0xFFFFD442);

  Color get borderColor => const Color(0xFFC6C6C6);

  Color get gradientWhiteColor => const Color(0x00000000);

  Color get gradientBlackColor => const Color(0x99000000);

  Color get inputTextFiledColor => const Color(0xFFF1F2F6);

  Color get blackOpacityColor => const Color(0xFF4B4744);

  Color get whisperBorderColor => const Color(0xFF808080);

  Color get orangeColor => const Color(0xFFED8423);

  Color get enableColor => const Color(0xFFCCCCCC);

  Color get errorColor => const Color(0xFFEF523E);

  Color get deleteColor => const Color(0xFFD6001C);

  Color get whiteYellowColor => const Color(0xFFFDFFF6);

  Color get purple => const Color(0xFF583160);

  Color get profileBorder => const Color(0xFFE6E5E5);

  Color get shadowColor => black.withOpacity(.04);

  Color get whisperOpacityColor => const Color(0xFF999999);

  Color get orangeBorderColor => const Color(0xFFE07B2C);

  Color get orangeOpacityColor => const Color(0xFFEEC09D);

  Color get containerBorderColor => const Color(0xFFE0E0DF);

  Color get dividerColor => const Color(0xFFC1BCB9);

  Color get dotsColor => const Color(0xFFDF893C);

  Color get greyColor => const Color(0xFF999999);

  Color get greyShade24 => const Color(0xFF777676);

  Color get socialMediaGreyColor => const Color(0xFF808080);

  Color get greenTabBorderColor => const Color(0xFF498E4C);

  Color get textLightColor => const Color(0xFFF6F6F6);

  Color get greenWithOpacity => const Color(0xFFC6DDC9);

  Color get tabGreyColor => const Color(0xFFB9B9B9);

  Color get tabIndicatorColor => const Color(0xFFD48D4B);

  Color get dateSelectedRangeColor => const Color(0xFFFFF1E3);

  Color get textDateColor => const Color(0xFFC4C4C7);

  Color get verticalBorderColor => const Color(0xFFD0D0D0);

  Color get redShadeColor => const Color(0xFFEC756F);

  Color get orangeShadeColor => const Color(0xFFEEAE52);

  Color get blueShadeColor => const Color(0xFF9BD0E3);

  Color get purpleShadeColor => const Color(0xFFADA1C6);

  Color get greenShadeColor => const Color(0xFF64CE95);

  Color get dividerGreyColor => const Color(0xFFDADADA);

  Color get greyShade80 => const Color(0xFFB4B4B4);

  Color get gredViewColor => const Color(0xFFD5CED7);

  Color get purpleTransparent => const Color(0xFFE4D8E6);

  Color get listViewTypeColor => const Color(0xFFD5CED7);

  Color get verticalDividerGreyColor => const Color(0xFF848484);

  Color get nutritionInfoTableGreyColor => const Color(0xFFDEDEDE);

  Color get footerColor => const Color(0xFFF4F4F4);

  Color get chipColor => const Color(0xFFE6E4E2);
  
}
