import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class HealthHotlineMagazineWidget extends StatelessWidget with BaseStatelessMixin {
  const HealthHotlineMagazineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: context.strings.learn_more_about_text,
                style: context.fonts.latoMedium.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              TextSpan(
                text: context.strings.natural_approach_to_living_text,
                style: context.fonts.latoBold.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              TextSpan(
                text: context.strings.check_out_our_health_text,
                style: context.fonts.latoMedium.copyWith(
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15.sp),
        Align(
          alignment: Alignment.center,
          child: CustomButton(
            onTap: () => launchUrl(
              Uri.parse(AppConstants.healthHotlineMagazineUrl),
              mode: LaunchMode.externalApplication,
            ),
            isColorFilled: false,
            showBorder: true,
            borderColor: context.colors.borderTrueColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.sp,
                horizontal: 30.sp,
              ),
              child: Text(
                context.strings.subscribe,
                style: context.fonts.latoRegular.copyWith(
                  fontSize: 16.sp,
                  color: context.colors.borderTrueColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
