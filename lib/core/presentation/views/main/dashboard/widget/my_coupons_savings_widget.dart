import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class MyCouponsSavings extends StatelessWidget with BaseStatelessMixin {
  const MyCouponsSavings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 48,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  context.strings.available,
                  style: context.fonts.latoSemiBold.copyWith(
                    fontSize: 16.sp,
                    color: context.colors.blackOpacityColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  '\$ 20.20',
                  style: context.fonts.latoSemiBold.copyWith(
                    fontSize: 12.sp,
                    color: context.colors.whisperOpacityColor,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: context.sizes.width * .29,
            decoration: BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(
                  color: context.colors.orangeOpacityColor,
                  width: 2.sp,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  context.strings.clipped,
                  style: context.fonts.latoSemiBold.copyWith(
                    color: context.colors.blackOpacityColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  '\$ 20.20',
                  style: context.fonts.latoSemiBold.copyWith(
                    fontSize: 12.sp,
                    color: context.colors.whisperOpacityColor,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  context.strings.ydt_savings,
                  style: context.fonts.latoSemiBold.copyWith(
                    fontSize: 16.sp,
                    color: context.colors.blackOpacityColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  '\$ 20.20',
                  style: context.fonts.latoSemiBold.copyWith(
                    fontSize: 12.sp,
                    color: context.colors.whisperOpacityColor,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
