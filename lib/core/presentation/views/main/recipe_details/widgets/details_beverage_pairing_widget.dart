import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';

class DetailsBeveragePairingWidget extends StatelessWidget {
  const DetailsBeveragePairingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: '${context.strings.recommended_beverage}: ',
            style: context.fonts.latoBold.copyWith(fontSize: 14.sp),
            children: [
              TextSpan(
                text: 'Wine', //todo: change later
                style: context.fonts.latoRegular.copyWith(fontSize: 14.sp),
              )
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            text: '${context.strings.recommended_style}: ',
            style: context.fonts.latoBold.copyWith(fontSize: 14.sp),
            children: [
              TextSpan(
                text: 'Pinot Noir', //todo: change later
                style: context.fonts.latoRegular.copyWith(fontSize: 14.sp),
              )
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            text: '${context.strings.recommended_brand}: ',
            style: context.fonts.latoBold.copyWith(fontSize: 14.sp),
            children: [
              TextSpan(
                text: 'Biokult Pinot Noir Zweigelt Blend', //todo: change later
                style: context.fonts.latoRegular.copyWith(fontSize: 14.sp),
              )
            ],
          ),
        )
      ],
    );
  }
}
