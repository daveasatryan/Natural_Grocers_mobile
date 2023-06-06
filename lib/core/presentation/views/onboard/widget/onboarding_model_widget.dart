import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/onboard/widget/dots_indicator_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class OnboardingModelWidget extends StatelessWidget with BaseStatelessMixin {
  OnboardingModelWidget({
    super.key,
    required this.image,
    required this.header,
    required this.index,
    required this.textBlack,
    required this.textRegular,
    this.isSkip = true,
  });

  String image;
  String header;
  int index;
  String textBlack;
  String textRegular;
  bool isSkip;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  width: context.sizes.width,
                  child: AspectRatio(
                    aspectRatio: 375 / 300,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 375 / 254,
                  child: Column(
                    children: [
                      SizedBox(height: 10.sp),
                      DotsIndicatorWidget(
                        color: context.colors.appSecondaryColor,
                        position: index,
                      ),
                      SizedBox(height: 18.sp),
                      Text(
                        header,
                        style: context.fonts.latoBlack.copyWith(
                          fontSize: 28.sp,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Center(
                        child: SizedBox(
                          width: context.sizes.width * .91,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: textBlack,
                                  style: context.fonts.latoBold.copyWith(
                                    fontSize: 16.sp,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                TextSpan(
                                  text: textRegular,
                                  style: context.fonts.latoRegular.copyWith(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.sp),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
