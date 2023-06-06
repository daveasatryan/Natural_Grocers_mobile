import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class TitleHeaderProfileWidget extends StatelessWidget with BaseStatelessMixin {
  const TitleHeaderProfileWidget({
    super.key,
    required this.title,
    this.style,
    this.showSeeAllButton = false,
    this.showIcon = false,
    this.onTap,
    this.iconColor,
  });

  final String title;
  final TextStyle? style;
  final bool showSeeAllButton;
  final bool showIcon;
  final Function? onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:
            showSeeAllButton || showIcon ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: style ??
                context.fonts.latoSemiBoldItalic.copyWith(
                  fontSize: 24.sp,
                  color: context.colors.blackOpacityColor,
                ),
          ),
          showIcon
              ? InkWell(
                  onTap: () => onTap?.call(),
                  child: SvgPicture.asset(
                    AppAssets.editIcon,
                    colorFilter: ColorFilter.mode(
                      iconColor ?? context.colors.greenScreenColor,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : showSeeAllButton
                  ? InkWell(
                      onTap: () => onTap?.call(),
                      child: Text(
                        context.strings.see_all,
                        style: context.fonts.latoRegularItalic.copyWith(
                          color: context.colors.whisperBorderColor,
                          fontSize: 18.sp,
                        ),
                      ),
                    )
                  : const SizedBox(),
        ],
      ),
    );
  }
}
