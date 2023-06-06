import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';

class DetailsDescriptionWidget extends StatelessWidget {
  final String? description;

  const DetailsDescriptionWidget({super.key, this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description ?? '',
      style: context.fonts.latoRegular.copyWith(fontSize: 14.sp),
    );
  }
}
