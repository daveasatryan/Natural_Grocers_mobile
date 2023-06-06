import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class TransactionsItemWidget extends StatelessWidget with BaseStatelessMixin {
  String date;
  String earned;
  String amount;

  TransactionsItemWidget({
    super.key,
    required this.date,
    required this.earned,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 13.sp),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15.sp,
          horizontal: 15.sp,
        ),
        decoration: BoxDecoration(
          color: context.colors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: context.colors.profileBorder,
              blurRadius: 4,
              offset: const Offset(4, 8),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(14.sp),
          ),
          border: Border.fromBorderSide(
            BorderSide(
              color: context.colors.profileBorder,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                date,
                style: context.fonts.latoMedium.copyWith(
                  fontSize: 14.sp,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                      color: context.colors.borderTrueColor,
                      borderRadius: BorderRadius.circular(100.sp),
                    ),
                    child: SvgPicture.asset(AppAssets.addIcon),
                  ),
                  SizedBox(width: 5.sp),
                  Expanded(
                    child: Text(
                      context.strings.pts_earned(12),
                      style: context.fonts.latoBlack.copyWith(
                        color: context.colors.borderTrueColor,
                        fontSize: 14.sp,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                '\$$amount',
                style: context.fonts.latoBlack.copyWith(overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
