import 'package:flutter/material.dart';
import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/find_store/find_store_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/preferred_store/preferred_store_widget.dart';

enum StorePageType {
  preferredStore,
  findStore;

  String get title {
    final strings = AppLocale.current;
    switch (this) {
      case StorePageType.preferredStore:
        return strings.preferred_store_title;
      case StorePageType.findStore:
        return strings.find_store;
    }
  }

  Widget get widget {
    switch (this) {
      case StorePageType.preferredStore:
        return const PreferredStoreWidget();
      case StorePageType.findStore:
        return const FindStoreWidget();
    }
  }
}
