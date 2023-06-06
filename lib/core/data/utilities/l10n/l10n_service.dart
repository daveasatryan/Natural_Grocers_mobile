import 'package:flutter/material.dart';
import 'package:natural_groceries/core/data/utilities/l10n/generated/l10n.dart';

/// Proxy class that provides access to localization
class AppLocale {
  /// Constructor to avoid public_member_api_docs insists.
  const AppLocale();

  /// Used to get current localization
  static S get current {
    return S.current;
  }

  /// Used to get current localization by context
  static S of(BuildContext context) {
    return S.of(context);
  }
}
