import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/recipe_filter_options_view_enum.dart';
import 'package:natural_groceries/core/data/enums/recipe_filters_enum.dart';
import 'package:natural_groceries/core/data/models/filters/filters_model.dart';

part 'recipe_filter_widget_event.freezed.dart';

@freezed
class RecipeFilterWidgetEvent with _$RecipeFilterWidgetEvent {
  const factory RecipeFilterWidgetEvent.getFilters(RecipeFiltersEnum recipeFiltersEnum) =
      GetFilters;

  const factory RecipeFilterWidgetEvent.selectFilter(
    FiltersModel filter,
    RecipeFiltersEnum recipeFiltersEnum,
    FilterOptionsViewType viewType,
  ) = SelectFilter;


  const factory RecipeFilterWidgetEvent.clearFilters() = ClearFilters;
}
