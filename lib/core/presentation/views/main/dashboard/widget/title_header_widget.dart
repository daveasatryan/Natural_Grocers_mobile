import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class TitleHeaderDashboardWidget extends StatelessWidget with BaseStatelessMixin {
  TitleHeaderDashboardWidget({
    super.key,
    required this.title,
    this.style,
    this.showSeeAllButton = true,
    this.onTap,
  });

  String title;
  TextStyle? style;
  bool showSeeAllButton;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:
          showSeeAllButton ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: style ??
              context.fonts.latoSemiBold.copyWith(
                fontSize: 24.sp,
                color: context.colors.blackOpacityColor,
                fontStyle: FontStyle.italic,
              ),
        ),
        showSeeAllButton
            ? InkWell(
                onTap: () => onTap?.call(),
                child: Text(
                  context.strings.see_all,
                  style: context.fonts.latoLight.copyWith(
                    fontStyle: FontStyle.italic,
                    color: context.colors.blackOpacityColor,
                    fontSize: 14.sp,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
