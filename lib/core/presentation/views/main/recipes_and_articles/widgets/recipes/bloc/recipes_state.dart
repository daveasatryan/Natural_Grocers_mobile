import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';

part 'recipes_state.freezed.dart';

@Freezed(equal: false)
class RecipesState with _$RecipesState {
  const factory RecipesState.initial({
    required ListViewType viewType,
    List<int>? favoriteItems,
  }) = _$RecipesStateInitial;

  const factory RecipesState.loading() = _$RecipesStateLoading;
}
