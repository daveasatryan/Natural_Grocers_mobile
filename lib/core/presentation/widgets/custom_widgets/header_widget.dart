import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class HeaderWidget extends StatelessWidget with BaseStatelessMixin {
  final bool isNested;
  final bool hasBack;
  String? text;
  Widget? headerWidget;
  String? headerImagePath;
  double? height;
  Color? fillColor;
  TextStyle? textStyle;

  HeaderWidget({
    super.key,
    this.text,
    this.textStyle,
    this.isNested = false,
    this.hasBack = true,
    this.height,
    this.headerWidget,
    this.fillColor,
    this.headerImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        width: context.sizes.width,
        height: height ?? 150.sp,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(headerImagePath ?? AppAssets.headerBackgroundIcon),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: context.colors.greenScreenColor.withOpacity(0.8),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hasBack ? 60.sp : 30.sp),
                child: Align(
                  alignment: Alignment.center,
                  child: headerWidget ??
                      AutoSizeText(
                        text ?? '',
                        style: textStyle ??
                            context.fonts.latoBlackItalic.copyWith(
                              color: context.colors.whiteColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                        maxLines: 1,
                      ),
                ),
              ),
              if (hasBack)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.sp),
                    child: InkWell(
                      onTap: () {
                        if (isNested) {
                          AppRoutes.backNested();
                        } else {
                          AppRoutes.back();
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: context.colors.whiteColor.withOpacity(0.7),
                        child: SvgPicture.asset(
                          AppAssets.headerLeftVectorIcon,
                          width: 10.sp,
                          height: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
