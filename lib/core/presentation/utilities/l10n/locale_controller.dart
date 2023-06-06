import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/presentation/utilities/l10n/language_service.dart';

/// Controller that stores and maintain data about localization
@singleton
class LocaleController with ChangeNotifier {
  /// Constructor that loads [Locale] and notifies listeners
  LocaleController(this._service) {
    _locale = _service.locale();
    notifyListeners();
  }

  late Locale _locale;
  final LocaleSettingsService _service;

  /// Current [Locale] in project
  Locale get locale => _locale;

  /// Returns true if [newLocale] is valid, either false
  bool checkLocale(Locale? newLocale) {
    if (newLocale == null) return false;
    if (newLocale == _locale) return false;

    return true;
  }

  /// Changes current [Locale] to 'en' or 'ru'
  // Future<void> changeLocale() async {
  //   if (_locale == const Locale('ru')) {
  //     _locale = const Locale('en');
  //   } else {
  //     _locale = const Locale('ru');
  //   }
  //   notifyListeners();
  // }

  /// Updates current [Locale] to [newLocale] and notifies listeners
  Future<void> updateLocale(Locale? newLocale) async {
    if (checkLocale(locale)) {
      _locale = newLocale!;
      notifyListeners();
    }
  }
}
