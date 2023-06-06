import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';

enum BottomNavEnum {
  dashboard,
  news,
  recipes,
  stores;

  String get svgIcon {
    switch (this) {
      case BottomNavEnum.dashboard:
        return AppAssets.icDashboard;
      case BottomNavEnum.news:
        return AppAssets.icStar;
      case BottomNavEnum.recipes:
        return AppAssets.icRecipes;
      case BottomNavEnum.stores:
        return AppAssets.icPlace;
    }
  }

  String get title {
    final strings = AppLocale.current;
    switch (this) {
      case BottomNavEnum.dashboard:
        return strings.npower;
      case BottomNavEnum.news:
        return strings.whats_new;
      case BottomNavEnum.recipes:
        return strings.recipes;
      case BottomNavEnum.stores:
        return strings.stores;
    }
  }

  String get page {
    switch (this) {
      case BottomNavEnum.dashboard:
        return AppRoutes.dashboardRoute;
      case BottomNavEnum.news:
        return AppRoutes.newsRoute;
      case BottomNavEnum.recipes:
        return AppRoutes.recipesRoute;
      case BottomNavEnum.stores:
        return AppRoutes.storesRoute;
    }
  }
}
