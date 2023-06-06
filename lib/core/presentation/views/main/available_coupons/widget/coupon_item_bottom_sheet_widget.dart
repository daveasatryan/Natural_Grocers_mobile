import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class CouponItemBottomSheetWidget extends StatelessWidget with BaseStatelessMixin {
  CouponItemBottomSheetWidget({
    super.key,
    this.date,
    this.icon,
    this.save,
    this.name,
  });

  String? date;
  String? icon;
  double? save;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      decoration: BoxDecoration(
        color: context.colors.whiteColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.sp),
          topLeft: Radius.circular(40.sp),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 25.sp),
            Container(
              width: context.sizes.width * .27,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: context.colors.dividerColor,
                    width: 4,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.sp),
            Text(
              context.strings.coupon_legal_disclaimer,
              style: context.fonts.latoBold.copyWith(
                fontSize: 24.sp,
                fontStyle: FontStyle.italic,
                color: context.colors.orangeColor,
              ),
            ),
            SizedBox(height: 15.sp),
            SizedBox(
              width: context.sizes.width * .36,
              child: Image.asset(AppAssets.productItemIcon),
            ),
            SizedBox(height: 20.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: context.sizes.width * .73,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.strings.expires(date ?? ''),
                        style: context.fonts.latoMedium.copyWith(
                          fontSize: 22.sp,
                          color: context.colors.whisperBorderColor,
                        ),
                      ),
                      SizedBox(height: 3.sp),
                      Text(
                        context.strings.save(save ?? 0),
                        style: context.fonts.latoBold.copyWith(
                          fontSize: 28.sp,
                        ),
                      ),
                      SizedBox(height: 3.sp),
                      Text(
                        name ?? '',
                        style: context.fonts.latoRegular.copyWith(
                          color: context.colors.whisperBorderColor,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(icon ?? '')
              ],
            ),
            SizedBox(height: 15.sp),
            Text(
              context.strings.category_coupon_limit_one,
              style: context.fonts.latoMedium.copyWith(
                fontSize: 14.sp,
                color: context.colors.black45Color,
              ),
            ),
            SizedBox(height: 20.sp),
          ],
        ),
      ),
    );
  }
}
