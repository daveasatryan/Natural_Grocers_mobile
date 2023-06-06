import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/recipe_filters_enum.dart';
import 'package:natural_groceries/core/data/models/filters/filters_model.dart';

part 'recipe_filter_widget_state.freezed.dart';

@Freezed(equal: false)
class RecipeFilterWidgetState with _$RecipeFilterWidgetState {
  const factory RecipeFilterWidgetState.loading() = _$RecipeFilterWidgetStateLoading;

  const factory RecipeFilterWidgetState.success({
    required Map<RecipeFiltersEnum, List<FiltersModel>> filtersMap,
  }) = _$RecipeFilterWidgetStateSuccess;

  const factory RecipeFilterWidgetState.error(String msg) = _$RecipeFilterWidgetStateError;
}

extension RecipeFilterWidgetStateExt on RecipeFilterWidgetState {
  bool buildWhen() => when(
        success: (_) => true,
        loading: () => true,
        error: (_) => false,
      );

  bool listenWhen() => !buildWhen();
}
