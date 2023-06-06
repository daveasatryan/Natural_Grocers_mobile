import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class NotificationOptions extends StatelessWidget with BaseStatelessMixin {
  final Widget headerRow;
  final Widget contentView;

  NotificationOptions({
    super.key,
    required this.headerRow,
    required this.contentView,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [headerRow, SizedBox(height: 34.sp), contentView],
    );
  }
}
