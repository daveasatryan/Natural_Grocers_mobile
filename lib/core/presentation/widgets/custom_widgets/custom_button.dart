import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final bool isColorFilled;
  final Function() onTap;

  bool enabled;
  bool showBorder;
  bool ignorePointer;
  final double? borderRadius;

  EdgeInsetsGeometry? padding;

  Color? color;
  Color? borderColor;

  CustomButton({
    super.key,
    required this.child,
    required this.isColorFilled,
    required this.onTap,
    this.color,
    this.padding,
    this.enabled = true,
    this.ignorePointer = false,
    this.showBorder = false,
    this.borderRadius,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: InkWell(
        splashFactory: null,
        onTap: enabled && !ignorePointer ? onTap : null,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: color ??
                (isColorFilled ? (context.colors.mainAppColor) : context.colors.transparent),
            border: Border.all(
              color: showBorder ? borderColor ?? context.colors.mainAppColor : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(
              borderRadius ?? 80.sp,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
