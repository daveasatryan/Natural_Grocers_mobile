import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/enums/dialog_icons.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';

class AppErrorWidget extends StatefulWidget {
  AppErrorWidget({
    super.key,
    required this.message,
    this.title,
    this.buttonText,
    this.showButton,
    this.onPressed,
    this.icons = DialogIcons.done,
  });

  DialogIcons icons;
  final String? title;
  final String message;
  final String? buttonText;
  final bool? showButton;
  Function()? onPressed;

  @override
  State<AppErrorWidget> createState() => _AppErrorWidgetState();
}

class _AppErrorWidgetState extends State<AppErrorWidget> with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    if (widget.showButton == false) {
      Timer(const Duration(seconds: 8), () {
        if (mounted) {
          Navigator.pop(context);
        }
      });
    }
    return Material(
      color: Colors.black.withOpacity(0.5.sp),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: sizes.width * .93,
                maxWidth: sizes.width * .93,
              ),
              child: Container(
                padding: EdgeInsets.only(top: 40.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        offset: const Offset(1.0, 1.0),
                        blurStyle: BlurStyle.outer,
                        blurRadius: 10.sp)
                  ],
                  borderRadius: BorderRadius.circular(
                    24.sp,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.sp),
                    Visibility(
                      visible: widget.title != null,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.sp),
                        child: Text(
                          widget.title ?? '',
                          style: fonts.latoBlack.copyWith(
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      widget.message,
                      style: fonts.latoRegular,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.sp),
                    (widget.showButton ?? true)
                        ? Padding(
                            padding: EdgeInsets.only(bottom: 30.sp),
                            child: CustomButton(
                              color: colors.borderTrueColor,
                              padding: EdgeInsets.zero,
                              isColorFilled: false,
                              onTap: () {
                                Navigator.pop(context);
                                widget.onPressed?.call();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.sp,
                                  horizontal: 24.sp,
                                ),
                                child: Text(
                                  widget.buttonText ?? strings.continue_,
                                  style: fonts.latoBold.copyWith(
                                    color: colors.whiteColor,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
            Positioned(
              top: -18.sp,
              child: Container(
                width: 68.sp,
                height: 68.sp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.sp), color: context.colors.whiteColor),
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: SvgPicture.asset(
                    widget.icons.svgIcon,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
