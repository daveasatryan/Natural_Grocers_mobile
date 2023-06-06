import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';

part 'recipes_event.freezed.dart';

@freezed
class RecipesEvent with _$RecipesEvent {
  const factory RecipesEvent.getRecipes({
    Map<String, dynamic>? queryMap,
  }) = GetRecipes;

  const factory RecipesEvent.toggleView({
    required ListViewType viewType,
  }) = ToggleView;

  const factory RecipesEvent.addToFavorites({
    required int itemId,
  }) = AddToFavorites;
}
