import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/utilities/date_utilities.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';
import 'package:natural_groceries/core/presentation/widgets/my_rewards_item_widget.dart';

class SeeRewardsBottomSheetWidget extends StatelessWidget with BaseStatelessMixin {
  const SeeRewardsBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.whiteColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.sp),
          topLeft: Radius.circular(40.sp),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 25.sp),
          Align(
            alignment: Alignment.center,
            child: Container(
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
          ),
          SizedBox(height: 15.sp),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.sp,
                  right: 20.sp,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        context.strings.my_rewards,
                        style: context.fonts.latoBlack.copyWith(
                          fontSize: 24.sp,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 85.sp,
                          height: 85.sp,
                          decoration: BoxDecoration(
                            color: context.colors.whiteColor,
                            borderRadius: BorderRadius.circular(100.sp),
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: context.colors.borderTrueColor,
                                width: 2.sp,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: Text(
                                    //todo
                                    '1000',
                                    style: context.fonts.latoBlack.copyWith(
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    context.strings.my_points,
                                    style: context.fonts.latoBlack.copyWith(
                                      fontSize: 18.sp,
                                      color: context.colors.whisperOpacityColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 5.sp),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          context.strings.next_reward,
                                          style: context.fonts.latoSemiBold.copyWith(
                                            fontSize: 16.sp,
                                            color: context.colors.blackOpacityColor,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        SizedBox(height: 5.sp),
                                        Text(
                                          context.strings.points_away(200, 2),
                                          style: context.fonts.latoSemiBold.copyWith(
                                            fontSize: 12.sp,
                                            color: context.colors.whisperOpacityColor,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5.sp),
                                  Container(
                                    width: context.sizes.width * .31,
                                    padding: EdgeInsets.only(left: 15.sp),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: context.colors.orangeBorderColor,
                                          width: 2.sp,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          context.strings.rewards_available,
                                          style: context.fonts.latoSemiBold.copyWith(
                                            fontSize: 14.sp,
                                            color: context.colors.blackOpacityColor,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        SizedBox(height: 5.sp),
                                        Text(
                                          context.strings.ready_to_clip(8.9),
                                          style: context.fonts.latoSemiBold.copyWith(
                                            fontSize: 12.sp,
                                            color: context.colors.whisperOpacityColor,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5.sp),
                            child: Text(
                              context.strings.reward,
                              style: context.fonts.latoBoldItalic.copyWith(
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            context.strings.earned,
                            style: context.fonts.latoBoldItalic.copyWith(
                              fontSize: 18.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            context.strings.redeemed,
                            style: context.fonts.latoBoldItalic.copyWith(
                              fontSize: 18.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.sp),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.sp),
                          child: MyRewardsItemWidget(
                            pts: context.strings.pts(21),
                            offPurchese: context.strings.off_purchase(2),
                            ptsReward: context.strings.pts_reward(200),
                            redeemedDate: DateUtilities.month,
                            earnedDate: DateUtilities.month,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
