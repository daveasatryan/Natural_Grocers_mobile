import 'package:natural_groceries/core/data/enums/recipe_filter_options_view_enum.dart';
import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';

enum ArticleFiltersEnum {
  sort,
  order,
  favorites,
  healthProtocol,
  dietarySupplements,
  foodTopics,
  healthTopics,
  sustainableFood;

  String get title {
    switch (this) {
      case ArticleFiltersEnum.sort:
        return AppLocale.current.sort;
      case ArticleFiltersEnum.order:
        return AppLocale.current.order;
      case ArticleFiltersEnum.favorites:
        return AppLocale.current.favorites;
      case ArticleFiltersEnum.healthProtocol:
        return AppLocale.current.health_protocol;
      case ArticleFiltersEnum.dietarySupplements:
        return AppLocale.current.dietary_supplements;
      case ArticleFiltersEnum.foodTopics:
        return AppLocale.current.food_topics;
      case ArticleFiltersEnum.healthTopics:
        return AppLocale.current.health_topics;
      case ArticleFiltersEnum.sustainableFood:
        return AppLocale.current.sustainable_food;
    }
  }

  FilterOptionsViewType get viewType {
    switch (this) {
      case ArticleFiltersEnum.sort:
        return FilterOptionsViewType.radio;
      case ArticleFiltersEnum.order:
        return FilterOptionsViewType.radio;
      case ArticleFiltersEnum.favorites:
        return FilterOptionsViewType.checkbox;
      case ArticleFiltersEnum.healthProtocol:
        return FilterOptionsViewType.checkbox;
      case ArticleFiltersEnum.dietarySupplements:
        return FilterOptionsViewType.checkbox;
      case ArticleFiltersEnum.foodTopics:
        return FilterOptionsViewType.checkbox;
      case ArticleFiltersEnum.healthTopics:
        return FilterOptionsViewType.checkbox;
      case ArticleFiltersEnum.sustainableFood:
        return FilterOptionsViewType.checkbox;
    }
  }

  String get queryName {
    switch (this) {
      case ArticleFiltersEnum.sort:
        return 'sort';
      case ArticleFiltersEnum.order:
        return 'order';
      case ArticleFiltersEnum.favorites:
        return 'favorites';
      case ArticleFiltersEnum.healthProtocol:
        return 'field_health_protocol[]';
      case ArticleFiltersEnum.dietarySupplements:
        return 'field_dietary_supplements[]';
      case ArticleFiltersEnum.foodTopics:
        return 'field_food_topics[]';
      case ArticleFiltersEnum.healthTopics:
        return 'field_health_topics[]';
      case ArticleFiltersEnum.sustainableFood:
        return 'field_sustainable_food[]';
    }
  }
}
