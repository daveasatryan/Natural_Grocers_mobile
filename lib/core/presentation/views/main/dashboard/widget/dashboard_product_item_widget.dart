import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class DashboardProductItemWidget extends StatelessWidget with BaseStatelessMixin {
  DashboardProductItemWidget({
    super.key,
    required this.name,
    required this.date,
    required this.save,
  });

  String name;
  double save;
  String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.sp),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.sp,
          horizontal: 18.sp,
        ),
        decoration: BoxDecoration(
          color: context.colors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: context.colors.profileBorder,
              blurRadius: 4,
              offset: const Offset(2, 6),
            ),
            BoxShadow(
              color: context.colors.profileBorder,
              blurRadius: 4,
              offset: const Offset(-2, 6),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(30.sp),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SizedBox(
                  width: context.sizes.width * .16,
                  height: 83,
                  child: Image.asset(
                    AppAssets.productItemIcon,
                  ),
                ),
                SizedBox(
                  width: context.sizes.width * .17,
                  child: SvgPicture.asset(
                    AppAssets.clipIcon,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.sp),
            Text(
              context.strings.expires(date),
              style: context.fonts.latoBold.copyWith(
                fontSize: 14.sp,
                color: context.colors.whisperBorderColor,
              ),
            ),
            SizedBox(height: 3.sp),
            Text(
              context.strings.save(save),
              style: context.fonts.latoBold.copyWith(
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 3.sp),
            Text(
              name,
              style: context.fonts.latoRegular.copyWith(
                color: context.colors.whisperBorderColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
