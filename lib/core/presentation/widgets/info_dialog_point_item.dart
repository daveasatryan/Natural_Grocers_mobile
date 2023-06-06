import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class InfoDialogPointItem extends StatelessWidget with BaseStatelessMixin {
  InfoDialogPointItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
  });

  String icon;
  String title;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        icon,
        width: 33.sp,
        height: 33.sp,
      ),
      title: Transform.translate(
        offset: Offset(-14.sp, 0),
        child: Text(
          title,
          style: context.fonts.latoBlackItalic.copyWith(
            color: context.colors.borderTrueColor,
            fontSize: 14.sp,
          ),
        ),
      ),
      subtitle: subtitle != null
          ? Transform.translate(
              offset: Offset(-14.sp, 0),
              child: Text(
                subtitle ?? '',
                style: context.fonts.latoRegularItalic.copyWith(
                  color: context.colors.borderTrueColor,
                ),
              ),
            )
          : null,
    );
  }
}
