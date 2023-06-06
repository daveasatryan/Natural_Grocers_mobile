import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/see_reward_bottm_sheet_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/info_dialog_widget.dart';

class MyProgresWidget extends StatefulWidget {
  const MyProgresWidget({super.key});

  @override
  State<MyProgresWidget> createState() => _MyProgresWidgetState();
}

class _MyProgresWidgetState extends State<MyProgresWidget> with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.colors.containerBorderColor),
        ),
      ),
      width: context.sizes.width,
      child: Column(
        children: [
          SizedBox(height: 20.sp),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.sp),
                  color: context.colors.borderTrueColor,
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 107.sp,
                  height: 107.sp,
                  decoration: BoxDecoration(
                    color: context.colors.borderTrueColor,
                    borderRadius: BorderRadius.circular(100.sp),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: context.colors.whiteColor,
                        width: 3.sp,
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
                            style: context.fonts.latoBlack
                                .copyWith(fontSize: 18.sp, color: context.colors.whiteColor),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            context.strings.my_points,
                            style: context.fonts.latoBlack.copyWith(
                              fontSize: 18.sp,
                              color: context.colors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.strings.my_progress,
                          style: context.fonts.latoSemiBold.copyWith(
                            fontSize: 24.sp,
                            color: context.colors.blackOpacityColor,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierColor: colors.barrierColor,
                              builder: (context) {
                                return const InfoDialogWidget(
                                  msg: 'info',
                                );
                              },
                            );
                          },
                          child: SvgPicture.asset(
                            AppAssets.noteIcon,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.sp),
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
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  constraints: BoxConstraints(maxHeight: context.sizes.height * .88),
                  useRootNavigator: true,
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return const SeeRewardsBottomSheetWidget();
                  },
                );
              },
              child: Text(
                context.strings.see_rewards,
                style: context.fonts.latoLight.copyWith(
                  fontSize: 14.sp,
                  color: context.colors.blackOpacityColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          SizedBox(height: 15.sp),
        ],
      ),
    );
  }
}
