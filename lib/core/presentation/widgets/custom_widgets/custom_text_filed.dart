import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String labelText;
  final bool isPasswordField;
  TextEditingController? controller;
  String? initialValue;
  String? errorText;
  String? obscuringCharacter;

  List<TextInputFormatter>? inputFormatters;
  bool hidePassword;
  bool? isValidSuffixIcon;
  int? maxLines;
  int? minLines;
  Color fillColor;
  Color? suffixIconColor;
  FocusNode? focusNode;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color? textColor;
  Color? cursorColor;
  int? maxLength;
  bool showSuccessIcon;
  bool showErrorIcon;
  bool showBorders;
  bool enabled;
  bool readOnly;
  bool ignoring;
  double borderWidth = 1;
  double borderRadius;
  double? contentPaddingVertical;
  double? contentPaddingHorizontal;
  TextCapitalization? textCapitalization;
  TextInputType? keyboardType;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  TextStyle? style;
  Color? borderColor;
  Function()? togglePasswordVisibility;
  Function()? onTap;
  Function(String)? onSubmitted;
  ValueChanged<String>? onChanged;

  CustomTextField({
    super.key,
    required this.hint,
    required this.labelText,
    this.isPasswordField = false,
    this.controller,
    this.isValidSuffixIcon,
    this.errorText,
    this.obscuringCharacter,
    required this.fillColor,
    this.suffixIconColor,
    this.initialValue,
    this.focusNode,
    this.maxLines = 1,
    this.minLines = 1,
    this.borderWidth = 1,
    this.hintStyle,
    this.labelStyle,
    this.style,
    this.textColor,
    this.maxLength,
    this.contentPaddingVertical,
    this.contentPaddingHorizontal,
    this.textCapitalization,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius = 80,
    this.keyboardType,
    this.showBorders = true,
    this.enabled = true,
    this.readOnly = false,
    this.hidePassword = false,
    this.showSuccessIcon = false,
    this.showErrorIcon = false,
    this.ignoring = false,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
    this.togglePasswordVisibility,
    this.borderColor,
    this.cursorColor,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    if (controller?.text != initialValue && initialValue != null) {
      controller?.text = initialValue ?? '';
    }
    return IgnorePointer(
      ignoring: ignoring,
      child: TextField(
        style: style ??
            context.fonts.latoBold.copyWith(
              color: textColor ?? context.colors.blackOpacityColor,
              fontSize: 14.sp,
            ),
        scrollPadding: EdgeInsets.only(bottom: 100.sp),
        keyboardType: keyboardType,
        focusNode: focusNode,
        textInputAction: TextInputAction.done,
        enabled: enabled,
        controller: controller,
        readOnly: readOnly,
        maxLines: maxLines,
        minLines: minLines,
        cursorColor: cursorColor ?? context.colors.greenScreenColor,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        obscureText: isPasswordField ? hidePassword : false,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        textAlignVertical: TextAlignVertical.center,
        // todo: Set default style,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            errorText: errorText,
            labelStyle: labelStyle,
            labelText: labelText,
            hintText: hint,
            hintStyle: hintStyle,
            filled: true,
            fillColor: fillColor,
            border: InputBorder.none,
            counterText: '',
            // todo: Set default hintStyle,
            contentPadding: EdgeInsets.symmetric(
              vertical: contentPaddingVertical ?? 5.sp,
              horizontal: contentPaddingHorizontal ?? 27.sp,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: isPasswordField && suffixIcon == null
                ? InkWell(
                    onTap: togglePasswordVisibility,
                    child: hidePassword
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: suffixIconColor ?? context.colors.whiteColor.withOpacity(0.6),
                          )
                        : Icon(
                            Icons.visibility_outlined,
                            color: suffixIconColor ?? context.colors.whiteColor.withOpacity(0.6),
                          ),
                  )
                : isValidSuffixIcon == true
                    ? Container(
                        padding: EdgeInsets.all(15.sp),
                        child: SvgPicture.asset(AppAssets.customTextFiledNotEmptyIcon))
                    : isValidSuffixIcon == false
                        ? Container(
                            padding: EdgeInsets.all(15.sp),
                            child: SvgPicture.asset(AppAssets.customTextFiledInvalidIcon))
                        : suffixIcon,
            errorBorder: showBorders
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius),
                    ),
                    borderSide: BorderSide(
                      width: borderWidth,
                      color: errorText.isNotNullOrEmpty()
                          ? context.colors.errorColor
                          : context.colors.borderTrueColor,
                    ),
                  )
                : null,
            enabledBorder: showBorders
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius),
                    ),
                    borderSide: BorderSide(
                        width: borderWidth, color: borderColor ?? context.colors.borderTrueColor),
                  )
                : null,
            focusedErrorBorder: showBorders
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius),
                    ),
                    borderSide: BorderSide(
                      width: borderWidth,
                      color: errorText.isNotNullOrEmpty()
                          ? context.colors.errorColor
                          : context.colors.borderTrueColor,
                    ),
                  )
                : null,
            focusedBorder: showBorders
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius),
                    ),
                    borderSide: BorderSide(
                      width: borderWidth,
                      color: errorText.isNotNullOrEmpty()
                          ? context.colors.errorColor
                          : borderColor ?? context.colors.borderTrueColor,
                    ),
                  )
                : null),
        onChanged: (value) {
          onChanged?.call(value);
        },
        onTap: onTap,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
