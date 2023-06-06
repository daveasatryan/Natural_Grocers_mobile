import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';

class BingoDetails extends StatelessWidget {
  const BingoDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sizes.height * .7,
      padding: EdgeInsets.only(top: 40.sp, bottom: 18.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.sp),
          topRight: Radius.circular(40.sp),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 30.sp,
                    width: 30.sp,
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: context.colors.greenScreenColor),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.headerLeftVectorIcon,
                      colorFilter:
                          ColorFilter.mode(context.colors.blackOpacityColor, BlendMode.srcIn),
                    ),
                  ),
                ),
                Text(
                  '${context.strings.spend} \$30',
                  style: context.fonts.latoBoldItalic
                      .copyWith(color: context.colors.borderTrueColor, fontSize: 36.sp),
                ),
                Container(width: 20.sp)
              ],
            ),
          ),
          SizedBox(height: 5.sp),
          Text(
            context.strings.on_body_care,
            textAlign: TextAlign.center,
            style: context.fonts.latoBoldItalic.copyWith(
              fontSize: 24.sp,
            ),
          ),
          SizedBox(height: 22.sp),
          Image.asset(AppAssets.soapImage),
          SizedBox(height: 50.sp),
          Divider(
            color: context.colors.dividerGreyColor,
            thickness: 2.sp,
          ),
          Text(
            '${context.strings.earn_from} 10/01/2022 - 10/31/2022',
            style: context.fonts.latoBold.copyWith(fontSize: 16.sp),
          ),
          Text(
            '12 ${context.strings.days_remaining}',
            style: context.fonts.latoBold.copyWith(
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 17.sp),
          Container(
            padding: EdgeInsets.all(25.sp),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.colors.greenScreenColor,
                  width: 4.sp,
                )),
            child: Column(
              children: [
                Text(
                  '\$15',
                  style: context.fonts.latoBlack.copyWith(fontSize: 24.sp),
                ),
                Text(
                  '${context.strings.of_text} \$30',
                  style: context.fonts.latoBold
                      .copyWith(color: context.colors.whisperBorderColor, fontSize: 18.sp),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
