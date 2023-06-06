import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/bingo_options/widgets/bingo_details.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/vitamins_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class BingoOptions extends StatelessWidget {
  const BingoOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(
                text: context.strings.n_power_clubs(AppConstants.nPower),
                textStyle: context.fonts.latoBlackItalic.copyWith(color: context.colors.whiteColor),
                isNested: true,
                height: 97.sp,
              ),
              SizedBox(height: 12.sp),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 22.sp, horizontal: 10.sp),
                  color: context.colors.borderTrueColor,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: context.colors.whiteColor.withOpacity(0.4),
                              height: 0.5.sp,
                            ),
                          ),
                          SizedBox(width: 20.sp),
                          Text(
                            context.strings.bingo('{N}'),
                            style: context.fonts.latoBlack.copyWith(
                              fontSize: 35.sp,
                              color: context.colors.whiteColor,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(width: 20.sp),
                          Expanded(
                            child: Divider(
                              color: context.colors.whiteColor.withOpacity(0.4),
                              height: 0.5.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        context.strings.complete_any_one_to_qualify,
                        style: context.fonts.latoBlack.copyWith(
                          color: context.colors.whiteColor,
                          fontSize: 16.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RewardWidget(
                            color: context.colors.redShadeColor,
                            word: 'B',
                          ),
                          SizedBox(width: 6.sp),
                          RewardWidget(
                            color: context.colors.orangeShadeColor,
                            word: 'I',
                          ),
                          SizedBox(width: 6.sp),
                          RewardWidget(
                            color: context.colors.blueShadeColor,
                            word: '{N}',
                          ),
                          SizedBox(width: 6.sp),
                          RewardWidget(
                            color: context.colors.purpleShadeColor,
                            word: 'G',
                          ),
                          SizedBox(width: 6.sp),
                          RewardWidget(
                            color: context.colors.greenShadeColor,
                            word: 'O',
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(height: 19.sp),
              Padding(
                padding: EdgeInsets.only(left: 8.sp),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                  itemCount: 25,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var generatedColor = Random().nextInt(Colors.primaries.length);
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          useRootNavigator: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.sp),
                          ),
                          builder: (context) {
                            return const BingoDetails();
                          },
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 68.sp,
                            width: 66.sp,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: context.colors.whisperBorderColor),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  context.strings.spend,
                                  style: context.fonts.latoBlack.copyWith(
                                      color: Colors.primaries[generatedColor], fontSize: 14.sp),
                                ),
                                SizedBox(height: 5.sp),
                                Text.rich(
                                  TextSpan(
                                      text: '\$',
                                      style: context.fonts.latoBlack.copyWith(
                                        color: Colors.primaries[generatedColor],
                                        fontSize: 14.sp,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: '150',
                                            style: context.fonts.latoBlack.copyWith(
                                              color: Colors.primaries[generatedColor],
                                              fontSize: 14.sp,
                                            ))
                                      ]),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 1.5.sp,
                            child: SizedBox(
                              height: 68.sp,
                              width: 66.sp,
                              child: CircularProgressIndicator(
                                color: Colors.primaries[generatedColor],
                                value: index / 100, // Change this value to update the progress
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30.sp),
              Divider(
                color: context.colors.dividerGreyColor,
                thickness: 2,
              ),
              SizedBox(height: 19.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.strings.how_to_win,
                      style: context.fonts.latoBold.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 5.sp),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ex',
                      style: context.fonts.latoRegular.copyWith(
                        color: context.colors.whisperOpacityColor,
                        fontSize: 16.sp,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
