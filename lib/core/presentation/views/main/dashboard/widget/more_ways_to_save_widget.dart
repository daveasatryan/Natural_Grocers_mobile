import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/vitamins_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class MoreWaysToSaveWidget extends StatelessWidget with BaseStatelessMixin {
  const MoreWaysToSaveWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.sp),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.colors.profileBorder,
            blurRadius: 4,
            offset: const Offset(1, 6),
          ),
          BoxShadow(
            color: context.colors.profileBorder,
            blurRadius: 4,
            offset: const Offset(1, 6),
          ),
        ],
        color: context.colors.whiteColor,
        borderRadius: BorderRadius.circular(24.sp),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.sp),
            decoration: BoxDecoration(
              color: context.colors.borderTrueColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.sp),
                topRight: Radius.circular(24.sp),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: context.colors.whiteColor.withOpacity(0.4),
                    height: 0.5.sp,
                  ),
                ),
                Text(
                  context.strings.bingo('{N}'),
                  style: context.fonts.latoBlack.copyWith(
                    fontSize: 35.sp,
                    color: context.colors.whiteColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: context.colors.whiteColor.withOpacity(0.4),
                    height: 0.5.sp,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
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
                      Text(
                        context.strings.complete_any_one_tine_To,
                        maxLines: 2,
                        style: context.fonts.latoRegularItalic.copyWith(
                          fontSize: 16.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Image.asset(
                    AppAssets.productItemIcon,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
