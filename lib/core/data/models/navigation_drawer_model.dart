import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';

class NavigationDrawerModel {
  String? title;
  String? destination;
  Widget? icon;

  NavigationDrawerModel({
    this.title,
    this.destination,
    this.icon,
  });

  static final List<NavigationDrawerModel> _items = [
    NavigationDrawerModel(
      title: AppLocale.current.our_story,
      icon: SvgPicture.asset(AppAssets.ourStory),
      destination: null,
    ),
    NavigationDrawerModel(
      title: AppLocale.current.product_standards,
      icon: SvgPicture.asset(AppAssets.productStandards),
      destination: null,
    ),
    NavigationDrawerModel(
      title: AppLocale.current.n_power_faqs(AppConstants.nPower),
      icon: SvgPicture.asset(AppAssets.nPowerFaqs),
      destination: AppRoutes.npowerFaqs,
    ),
    NavigationDrawerModel(
      title: AppLocale.current.communication_preferences,
      icon: SvgPicture.asset(AppAssets.communicationPreferences),
      destination: AppRoutes.communicationPreferences,
    ),
    NavigationDrawerModel(
      title: AppLocale.current.terms_and_privacy_policy,
      icon: SvgPicture.asset(AppAssets.termsAndPrivacyPolicy),
      destination: null,
    ),
    NavigationDrawerModel(
      title: AppLocale.current.personal_data_requests,
      icon: SvgPicture.asset(AppAssets.personalDataRequests),
      destination: null,
    ),
    NavigationDrawerModel(
      title: AppLocale.current.contact_us,
      icon: SvgPicture.asset(AppAssets.contactUs),
      destination: AppRoutes.contactUs,
    ),
  ];

  static List<NavigationDrawerModel> get getDrawerModel => _items;
}
