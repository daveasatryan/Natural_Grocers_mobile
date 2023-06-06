import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class ContactUsHeader extends StatelessWidget with BaseStatelessMixin {
  const ContactUsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.strings.contact_us_header_title,
          style: context.fonts.latoBoldItalic.copyWith(fontSize: 24.sp),
        ),
        SizedBox(height: 12.sp),
        Text(
          context.strings.contact_us_header_desc(AppConstants.nPower),
          style: context.fonts.latoMedium.copyWith(fontSize: 14.sp),
        )
      ],
    );
  }
}
