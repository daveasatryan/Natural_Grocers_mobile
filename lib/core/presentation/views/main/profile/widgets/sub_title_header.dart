import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';

class SubTitleHeader extends StatelessWidget with BaseStatelessMixin {
  const SubTitleHeader({
    super.key,
    required this.text,
    this.textButton,
    this.style,
    this.showButton = false,
    this.onTap,
  });

  final String text;
  final String? textButton;
  final TextStyle? style;
  final bool? showButton;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          showButton == true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: style ??
              context.fonts.latoRegularItalic.copyWith(
                fontSize: 24.sp,
                color: context.colors.whisperBorderColor,
              ),
        ),
        showButton == true
            ? CustomButton(
                color: context.colors.borderTrueColor,
                padding: EdgeInsets.symmetric(
                  vertical: 5.sp,
                  horizontal: 14.sp,
                ),
                onTap: () => onTap?.call(),
                isColorFilled: false,
                child: Text(
                  textButton ?? '',
                  style: context.fonts.latoBold.copyWith(
                    fontSize: 16.sp,
                    color: context.colors.gredViewColor,
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
