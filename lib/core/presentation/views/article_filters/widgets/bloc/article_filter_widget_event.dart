import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/article_filters_enum.dart';
import 'package:natural_groceries/core/data/enums/recipe_filter_options_view_enum.dart';
import 'package:natural_groceries/core/data/models/filters/filters_model.dart';

part 'article_filter_widget_event.freezed.dart';

@freezed
class ArticleFilterWidgetEvent with _$ArticleFilterWidgetEvent {
  const factory ArticleFilterWidgetEvent.getFilters(ArticleFiltersEnum articleFiltersEnum) =
      GetFilters;

  const factory ArticleFilterWidgetEvent.selectFilter(
    FiltersModel filter,
    ArticleFiltersEnum articleFiltersEnum,
    FilterOptionsViewType viewType,
  ) = SelectFilter;

  const factory ArticleFilterWidgetEvent.clearFilters() = ClearFilters;
}
