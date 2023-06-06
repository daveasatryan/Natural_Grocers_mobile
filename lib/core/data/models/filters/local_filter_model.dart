import 'package:natural_groceries/core/data/enums/recipe_filter_options_view_enum.dart';
import 'package:natural_groceries/core/data/models/filters/filters_model.dart';
import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';

class LocalFilterModel {
  final int id;
  final String filterName;
  final List<FiltersModel> filters;
  final FilterOptionsViewType optionsViewType;

  LocalFilterModel({
    required this.id,
    required this.filterName,
    required this.filters,
    required this.optionsViewType,
  });
}

class LocalFilterModelHelper {
  final List<LocalFilterModel> _values = [
    LocalFilterModel(
      id: 1,
      filterName: AppLocale.current.sort,
      optionsViewType: FilterOptionsViewType.radio,
      filters: [
        FiltersModel(
          name: AppLocale.current.newest,
        ),
        FiltersModel(
          name: AppLocale.current.popularity,
        ),
        FiltersModel(
          name: AppLocale.current.time_to_prepare,
        ),
        FiltersModel(
          name: AppLocale.current.title,
        ),
      ],
    ),
    LocalFilterModel(
      id: 2,
      filterName: AppLocale.current.order,
      optionsViewType: FilterOptionsViewType.radio,
      filters: [
        FiltersModel(
          name: AppLocale.current.descending,
        ),
        FiltersModel(
          name: AppLocale.current.ascending,
        ),
      ],
    ),
    LocalFilterModel(
      id: 3,
      filterName: AppLocale.current.favorites,
      optionsViewType: FilterOptionsViewType.checkbox,
      filters: [
        FiltersModel(
          name: AppLocale.current.see_favorites_only,
        ),
      ],
    ),
  ];

  List<LocalFilterModel> get getFilters => _values;
}
