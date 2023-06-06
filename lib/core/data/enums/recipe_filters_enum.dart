import 'package:natural_groceries/core/data/enums/recipe_filter_options_view_enum.dart';
import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';

enum RecipeFiltersEnum {
  sort,
  order,
  favorites,
  course,
  mainIngredient,
  dietaryPreference;

  String get title {
    switch (this) {
      case RecipeFiltersEnum.sort:
        return AppLocale.current.sort;
      case RecipeFiltersEnum.order:
        return AppLocale.current.order;
      case RecipeFiltersEnum.favorites:
        return AppLocale.current.favorites;
      case RecipeFiltersEnum.course:
        return AppLocale.current.course;
      case RecipeFiltersEnum.mainIngredient:
        return AppLocale.current.main_ingredient;
      case RecipeFiltersEnum.dietaryPreference:
        return AppLocale.current.dietary_preference;
    }
  }

  FilterOptionsViewType get viewType {
    switch (this) {
      case RecipeFiltersEnum.sort:
        return FilterOptionsViewType.radio;
      case RecipeFiltersEnum.order:
        return FilterOptionsViewType.radio;
      case RecipeFiltersEnum.favorites:
        return FilterOptionsViewType.checkbox;
      case RecipeFiltersEnum.course:
        return FilterOptionsViewType.checkbox;
      case RecipeFiltersEnum.mainIngredient:
        return FilterOptionsViewType.checkbox;
      case RecipeFiltersEnum.dietaryPreference:
        return FilterOptionsViewType.checkbox;
    }
  }

  String get queryName {
    switch (this) {
      case RecipeFiltersEnum.sort:
        return 'sort';
      case RecipeFiltersEnum.order:
        return 'order';
      case RecipeFiltersEnum.favorites:
        return 'favorites';
      case RecipeFiltersEnum.course:
        return 'field_recipe_course[]';
      case RecipeFiltersEnum.mainIngredient:
        return 'field_recipe_dish_type[]';
      case RecipeFiltersEnum.dietaryPreference:
        return 'field_recipe_special_diet[]';
    }
  }
}
