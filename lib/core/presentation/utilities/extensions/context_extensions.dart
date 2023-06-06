import 'package:flutter/material.dart';
import 'package:natural_groceries/core/data/utilities/l10n/generated/l10n.dart';
import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';
import 'package:natural_groceries/core/presentation/utilities/color/app_colors.dart';
import 'package:natural_groceries/core/presentation/utilities/color/color_scheme.dart';

extension BuildContextExt on BuildContext {
  AppColors get colors => Theme.of(this).colorScheme.appColors;

  TextTheme get fonts => Theme.of(this).textTheme;

  Size get sizes => MediaQuery.of(this).size;

  S get strings => AppLocale.of(this);

  void hideKeyboard() => FocusScope.of(this).unfocus();
}
