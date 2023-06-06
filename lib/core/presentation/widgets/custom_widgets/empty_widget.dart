import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';

class CustomEmptyWidget extends StatelessWidget {
  CustomEmptyWidget({
    super.key,
    this.icon = AppAssets.noCouponsIcon,
    required this.text,
  });

  String icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(icon),
        SizedBox(height: 30.sp),
        Text(
          text,
          style: context.fonts.latoRegularItalic.copyWith(
            fontSize: 24.sp,
            color: context.colors.whisperBorderColor,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
