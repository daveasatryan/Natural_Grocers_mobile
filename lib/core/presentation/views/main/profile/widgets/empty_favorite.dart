import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';

class EmptyFavoriteWidget extends StatelessWidget {
  const EmptyFavoriteWidget({
    super.key,
    required this.text,
    required this.textButton,
    this.onTap,
  });

  final String text;
  final String textButton;
  final dynamic Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: context.fonts.latoMedium.copyWith(
            color: context.colors.whisperBorderColor,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 15.sp),
        Align(
          alignment: Alignment.center,
          child: CustomButton(
            color: context.colors.whiteColor,
            borderColor: context.colors.borderTrueColor,
            showBorder: true,
            padding: EdgeInsets.symmetric(
              vertical: 12.sp,
              horizontal: 18.sp,
            ),
            onTap: onTap ?? () {},
            isColorFilled: false,
            child: Text(
              textButton,
              style: context.fonts.latoRegular.copyWith(
                fontSize: 16.sp,
                color: context.colors.borderTrueColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
