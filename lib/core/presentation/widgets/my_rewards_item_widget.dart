import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class MyRewardsItemWidget extends StatelessWidget with BaseStatelessMixin {
  String pts;
  String offPurchese;
  String ptsReward;
  String? earnedDate;
  String? redeemedDate;
  bool? clip;

  MyRewardsItemWidget({
    super.key,
    required this.pts,
    required this.offPurchese,
    required this.ptsReward,
    this.earnedDate,
    this.redeemedDate,
    this.clip,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.spIcon,
                  ),
                  SizedBox(width: 5.sp),
                  Text(
                    pts,
                    style: context.fonts.latoBlack.copyWith(
                      color: context.colors.borderTrueColor,
                      fontSize: 20.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.sp),
                child: Text(
                  offPurchese,
                  style: context.fonts.latoRegular,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.sp),
                child: Text(
                  ptsReward,
                  style: context.fonts.latoRegular,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: earnedDate != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '• ',
                      style:
                          context.fonts.latoBlack.copyWith(color: context.colors.orangeBorderColor),
                    ),
                    Text(
                      earnedDate ?? '',
                      style: context.fonts.latoMedium.copyWith(fontSize: 14.sp),
                    ),
                  ],
                )
              : Text(
                  '_',
                  style: context.fonts.latoMedium.copyWith(fontSize: 14.sp),
                  textAlign: TextAlign.center,
                ),
        ),
        Expanded(
          child: clip == true
              ? SvgPicture.asset(AppAssets.clipIcon)
              : clip == false
                  ? Text(
                      context.strings.rewardLoaded,
                      style: context.fonts.latoMedium.copyWith(
                        fontSize: 14.sp,
                        color: context.colors.greenTabBorderColor,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : redeemedDate != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '• ',
                              style: context.fonts.latoBlack
                                  .copyWith(color: context.colors.greenTabBorderColor),
                            ),
                            Text(
                              redeemedDate ?? '',
                              style: context.fonts.latoMedium.copyWith(fontSize: 14.sp),
                            ),
                          ],
                        )
                      : Text(
                          '_',
                          textAlign: TextAlign.center,
                          style: context.fonts.latoMedium.copyWith(fontSize: 14.sp),
                        ),
        ),
      ],
    );
  }
}
