import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';

class CustomDropDown<T> extends StatelessWidget {
  final String hint;
  final String labelText;
  final List<DropdownMenuItem<T>> items;

  final Function(T? value) onChanged;
  final T? value;
  final bool enabled;
  final Color borderColor;
  final Color dropdownBorderColor;
  final List<Widget>? selectedItemBuilder;
  TextStyle? style;
  TextStyle? labelStyle;
  TextStyle? hintStyle;
  Color? color;
  double borderRadius;
  double borderWidth;
  bool? showErrorIcon;
  bool showDropDownIcon;
  bool ignorePointer;
  String? errorText;
  EdgeInsetsGeometry? contentPadding;
  BoxDecoration? dropdownDecoration;
  Widget Function(BuildContext context, Widget child)? selectedMenuItemBuilder;

  CustomDropDown({
    super.key,
    required this.hint,
    required this.labelText,
    required this.items,
    required this.onChanged,
    this.selectedItemBuilder,
    this.value,
    this.color,
    this.style,
    this.labelStyle,
    this.hintStyle,
    this.contentPadding,
    this.borderWidth = 1,
    this.showErrorIcon,
    this.showDropDownIcon = true,
    this.borderRadius = 80,
    this.enabled = true,
    this.selectedMenuItemBuilder,
    this.dropdownDecoration,
    this.errorText,
    this.ignorePointer = false,
    this.borderColor = const Color(0xFF323C48),
    this.dropdownBorderColor = const Color(0xFF323C48),
  });

  void fullText(option) {}

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignorePointer,
      child: Opacity(
        opacity: enabled ? 1 : .5,
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField2<T>(
            isDense: true,
            dropdownSearchData: const DropdownSearchData(),

            menuItemStyleData: MenuItemStyleData(
              selectedMenuItemBuilder: selectedMenuItemBuilder,
            ),
            decoration: InputDecoration(
              hintText: hint,
              label: Text(labelText, style: labelStyle),
              hintStyle: style ??
                  context.fonts.latoRegular.copyWith(
                    color: context.colors.whisperColor,
                  ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              alignLabelWithHint: true,
              errorText: errorText,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: showErrorIcon == false
                      ? context.colors.errorColor
                      : showErrorIcon == true
                          ? borderColor
                          : borderColor,
                ),
                borderRadius: BorderRadius.circular(80.sp),
              ),
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(
                    vertical: 13.sp,
                    horizontal: 27.sp,
                  ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80.sp),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              elevation: 0,
              maxHeight: 300.sp,
              decoration: dropdownDecoration,
            ),
            value:
                items.firstWhereOrNull((element) => element.value == value) != null ? value : null,
            items: items,
            iconStyleData: IconStyleData(
              icon: showErrorIcon == false
                  ? SvgPicture.asset(AppAssets.customTextFiledInvalidIcon)
                  : showErrorIcon == true
                      ? SvgPicture.asset(AppAssets.customTextFiledNotEmptyIcon)
                      : SvgPicture.asset(AppAssets.downIcon),
              iconSize: 0,
            ),
            isExpanded: true,
            onChanged: onChanged,
            selectedItemBuilder: selectedItemBuilder?.let((self) => (context) => self),
          ),
        ),
      ),
    );
  }
}
