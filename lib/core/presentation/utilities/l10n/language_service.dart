import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocaleSettingsService {
  Locale locale() {
    return const Locale('en');
  }
}
