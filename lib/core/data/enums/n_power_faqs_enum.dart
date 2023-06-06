import 'package:flutter/material.dart';
import 'package:natural_groceries/core/data/models/faqs/faqs_model.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';
import 'package:natural_groceries/core/presentation/views/n_power_faqs/widgets/sub_tabs/sub_tabs_widget.dart';

enum NPowerFaqsEnum {
  account,
  points,
  rewards,
  coupons,
  miscellaneous;

  factory NPowerFaqsEnum.fromIndex(int index) {
    switch(index) {
      case 0:
        return NPowerFaqsEnum.account;
      case 1:
        return NPowerFaqsEnum.points;
      case 2:
        return NPowerFaqsEnum.rewards;
      case 3:
        return NPowerFaqsEnum.coupons;
      case 4:
        return NPowerFaqsEnum.miscellaneous;
      default:
        return NPowerFaqsEnum.account;
    }
  }

  String get title {
    switch (this) {
      case NPowerFaqsEnum.account:
        return AppLocale.current.n_power_account(AppConstants.nPower);
      case NPowerFaqsEnum.points:
        return AppLocale.current.points;
      case NPowerFaqsEnum.rewards:
        return AppLocale.current.rewards;
      case NPowerFaqsEnum.coupons:
        return AppLocale.current.coupons;
      case NPowerFaqsEnum.miscellaneous:
        return AppLocale.current.miscellaneous;
    }
  }

  String get tabTitle {
    switch (this) {
      case NPowerFaqsEnum.account:
        return AppLocale.current.account;
      case NPowerFaqsEnum.points:
        return AppLocale.current.points;
      case NPowerFaqsEnum.rewards:
        return AppLocale.current.rewards;
      case NPowerFaqsEnum.coupons:
        return AppLocale.current.coupons;
      case NPowerFaqsEnum.miscellaneous:
        return AppLocale.current.miscellaneous;
    }
  }

  Widget widget(FaqsModel? faqsModel) {
    switch (this) {
      case NPowerFaqsEnum.account:
        return SubTabsWidget(title: title, faqsList: faqsModel?.npowerAccount);
      case NPowerFaqsEnum.points:
        return SubTabsWidget(title: title, faqsList: faqsModel?.points);
      case NPowerFaqsEnum.rewards:
        return SubTabsWidget(title: title, faqsList: faqsModel?.rewards);
      case NPowerFaqsEnum.coupons:
        return SubTabsWidget(title: title, faqsList: faqsModel?.coupons);
      case NPowerFaqsEnum.miscellaneous:
        return SubTabsWidget(title: title, faqsList: faqsModel?.miscellaneous);
    }
  }
}
