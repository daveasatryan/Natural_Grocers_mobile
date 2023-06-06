import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';

enum ValidationValidInvalid { valid, invalid }

extension ValidationValidInvalidExt on ValidationValidInvalid {
  String? get errorMassage {
    final strings = AppLocale.current;

    switch (this) {
      case ValidationValidInvalid.valid:
        return null;
      case ValidationValidInvalid.invalid:
        return strings.input_error_text_here;
    }
  }
}
