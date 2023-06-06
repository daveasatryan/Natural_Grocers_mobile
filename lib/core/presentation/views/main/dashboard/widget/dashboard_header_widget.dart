import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class DashboardHeaderWidget extends StatelessWidget with BaseStatelessMixin {
  const DashboardHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AspectRatio(
          aspectRatio: 375 / 151,
          child: Container(
            foregroundDecoration: BoxDecoration(
              color: context.colors.greenScreenColor.withOpacity(0.7),
            ),
            child: Image.asset(
              AppAssets.headerBackgroundIcon,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 30.sp),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: context.sizes.width * .30,
                  child: Image.asset(AppAssets.backDashboardIcon),
                ),
                SizedBox(
                  width: context.sizes.width * .25,
                  child: Image.asset(AppAssets.dashboardManIcon),
                ),
              ],
            ),
            SizedBox(width: 10.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.sp,
                    child: Image.asset(AppAssets.nPowerIcon),
                  ),
                  SizedBox(height: 10.sp),
                  Text(
                    context.strings.every_200_point,
                    style: context.fonts.latoMediumItalic.copyWith(
                      fontSize: 18.sp,
                      color: context.colors.whiteYellowColor,
                    ),
                  ),
                  Text(
                    context.strings.earns_reward(2),
                    style: context.fonts.latoMediumItalic.copyWith(
                      fontSize: 18.sp,
                      color: context.colors.whiteYellowColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
