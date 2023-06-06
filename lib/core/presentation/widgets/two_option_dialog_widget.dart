import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/enums/dialog_icons.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';

class TwoOptionDialogWidget extends StatefulWidget {
  TwoOptionDialogWidget({
    super.key,
    required this.msg,
    this.title,
    this.positiveButtonText,
    this.positiveButtonClick,
    this.negativeButtonText,
    this.negativeButtonClick,
    this.showHeaderIcon,
    this.msgPadding,
    this.msgStyle,
    this.titleStyle,
    this.icons = DialogIcons.done,
  });

  DialogIcons icons;
  final String? title;
  final String msg;
  final String? positiveButtonText;
  final VoidCallback? positiveButtonClick;
  final String? negativeButtonText;
  final VoidCallback? negativeButtonClick;
  final bool? showHeaderIcon;
  final EdgeInsets? msgPadding;
  final TextStyle? msgStyle;
  final TextStyle? titleStyle;

  @override
  State<TwoOptionDialogWidget> createState() => _TwoOptionDialogWidgetState();
}

class _TwoOptionDialogWidgetState extends State<TwoOptionDialogWidget> with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: sizes.width * .93,
                maxWidth: sizes.width * .93,
              ),
              child: Container(
                padding: EdgeInsets.only(top: 20.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: context.colors.black45Color,
                        offset: const Offset(1.0, 1.0),
                        blurStyle: BlurStyle.outer,
                        blurRadius: 10.sp)
                  ],
                  borderRadius: BorderRadius.circular(
                    24,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: widget.title != null,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.sp, bottom: 10.sp),
                        child: Text(
                          widget.title ?? '',
                          style: widget.titleStyle ??
                              fonts.latoBlack.copyWith(
                                fontSize: 20.sp,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: widget.msgPadding ?? EdgeInsets.zero,
                      child: Text(
                        widget.msg,
                        style: widget.msgStyle ?? fonts.latoRegular,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 25.sp),
                    FractionallySizedBox(
                      widthFactor: .82,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomButton(
                              borderColor: colors.borderTrueColor,
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              isColorFilled: false,
                              showBorder: true,
                              onTap: () {
                                Navigator.pop(context);
                                widget.negativeButtonClick?.call();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.sp,
                                ),
                                child: Center(
                                  child: Text(
                                    widget.negativeButtonText ?? '',
                                    style: fonts.latoRegular.copyWith(
                                      color: colors.borderTrueColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12.sp),
                          Expanded(
                            child: CustomButton(
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              isColorFilled: true,
                              onTap: () {
                                Navigator.pop(context, true);
                                widget.positiveButtonClick?.call();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.sp),
                                child: Center(
                                  child: Text(
                                    widget.positiveButtonText ?? '',
                                    style: fonts.latoBold.copyWith(
                                      color: colors.whiteColor,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.sp),
                  ],
                ),
              ),
            ),
            if (widget.showHeaderIcon == true)
              Positioned(
                top: -18.sp,
                child: Container(
                  width: 68.sp,
                  height: 68.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.sp),
                    color: context.colors.whiteColor,
                  ),
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
