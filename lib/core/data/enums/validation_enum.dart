import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';

enum ValidationEnum { none, valid, empty, notEmpty, invalid }

extension ValidationEnumExt on ValidationEnum {

  String? get errorMessageFirstName {
    final strings = AppLocale.current;
    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_email;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? get errorMessageLastName {
    final strings = AppLocale.current;
    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_email;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? get errorMessage {
    final strings = AppLocale.current;
    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_email;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? get errorMassagePassword {
    final strings = AppLocale.current;

    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_filed;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? get errorMassageConfirmPassword {
    final strings = AppLocale.current;

    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.passwords_doesnt_match;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? get errorMassageCurrentPassword {
    final strings = AppLocale.current;

    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_filed;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? get errorMessageEmail {
    final strings = AppLocale.current;
    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_email;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? get errorMassagePhoneNumber {
    final strings = AppLocale.current;

    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_phone_number;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? get errorMessagePreferredStore {
    final strings = AppLocale.current;

    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_store;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }
}
