import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class BaseAppBarWidget extends StatelessWidget
    with BaseStatelessMixin
    implements PreferredSizeWidget {
  BaseAppBarWidget({
    super.key,
    this.leading = const SizedBox(),
    this.actions = const [],
    this.title = const SizedBox(),
    this.backgroundColor,
  });

  Widget leading;
  List<Widget> actions;
  Widget title;
  SystemUiOverlayStyle? overlayStyle;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 50.sp,
      leading: leading,
      backgroundColor: backgroundColor ?? context.colors.whiteColor,
      elevation: 0,
      actions: actions,
      title: title,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(75.sp);
}
