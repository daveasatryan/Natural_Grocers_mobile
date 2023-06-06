import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class TransactionItemDetailsWidget extends StatelessWidget with BaseStatelessMixin {
  const TransactionItemDetailsWidget({
    super.key,
    required this.desc,
    required this.quantity,
    required this.amount,
  });

  final String desc;
  final int quantity;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.sp),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              desc,
              style: context.fonts.latoMedium.copyWith(
                color: context.colors.whisperBorderColor,
                fontSize: 14.sp,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              quantity.toString(),
              style: context.fonts.latoMedium.copyWith(
                color: context.colors.whisperBorderColor,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '\$$amount',
              style: context.fonts.latoMedium.copyWith(
                color: context.colors.whisperBorderColor,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
