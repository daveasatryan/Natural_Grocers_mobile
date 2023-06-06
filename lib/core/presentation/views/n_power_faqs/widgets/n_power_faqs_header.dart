import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class NPowerFaqsHeader extends StatelessWidget with BaseStatelessMixin {
  const NPowerFaqsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.strings.what_is_n_power(AppConstants.nPower),
          style: context.fonts.latoBoldItalic.copyWith(fontSize: 24.sp),
        ),
        SizedBox(height: 11.sp),
        Text(
          context.strings.faqs_desc_text(AppConstants.nPower),
          style: context.fonts.latoMedium.copyWith(fontSize: 14.sp),
        )
      ],
    );
  }
}
