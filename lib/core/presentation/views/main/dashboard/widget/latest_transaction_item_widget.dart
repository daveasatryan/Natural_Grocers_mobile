import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class LatestTransactionItemWidget extends StatelessWidget with BaseStatelessMixin {
  LatestTransactionItemWidget({
    super.key,
    required this.date,
    required this.amount,
    required this.perEarned,
  });

  final String date;
  final String perEarned;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15.sp,
        top: 8.sp,
        bottom: 8.sp,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppAssets.ellipseIcon),
              SizedBox(width: 6.sp),
              Text(
                date,
                style: context.fonts.latoMedium.copyWith(
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(width: 6.sp),
          Container(
            alignment: Alignment.center,
            width: context.sizes.width * .45,
            child: Text(
              '$perEarned pts earned',
              style: context.fonts.latoMedium.copyWith(
                fontSize: 12.sp,
              ),
            ),
          ),
          Expanded(
            child: Text(
              //todo
              '\$ $amount',
              textAlign: TextAlign.center,
              style: context.fonts.latoMedium.copyWith(
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
