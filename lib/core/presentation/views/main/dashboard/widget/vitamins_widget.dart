import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class RewardWidget extends StatelessWidget with BaseStatelessMixin {
  const RewardWidget({
    super.key,
    required this.color,
    required this.word,
  });

  final String word;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.sp),
        color: color,
      ),
      child: Container(
        alignment: Alignment.center,
        width: 35.sp,
        height: 35.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.sp),
          color: color,
          border: Border.fromBorderSide(
            BorderSide(color: context.colors.whiteColor),
          ),
        ),
        child: Text(
          word,
          style: context.fonts.latoBlack.copyWith(
            fontSize: 20.sp,
            fontStyle: FontStyle.italic,
            color: context.colors.whiteColor,
          ),
        ),
      ),
    );
  }
}
