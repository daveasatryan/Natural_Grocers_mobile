import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color =
        Random().nextBool() ? context.colors.purple : context.colors.greenTabBorderColor;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        border: Border.all(
          color: color,
          width: 1.sp,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10.sp),
              ),
              color: color,
            ),
            padding: EdgeInsets.symmetric(vertical: 14.sp),
            child: Center(
              child: Text(
                context.strings.what_new,
                style: context.fonts.latoExtraBold.copyWith(
                  fontSize: 14.sp,
                  color: context.colors.whiteColor,
                ),
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 338 / 134,
            child: Center(
              child: Text(
                'image placeholder',
                style: context.fonts.latoSemiBold.copyWith(
                  color: context.colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
