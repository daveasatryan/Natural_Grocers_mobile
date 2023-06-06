import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/recipes_and_articles_enum.dart';

part 'recipes_and_articles_state.freezed.dart';

@Freezed(equal: false)
class RecipesAndArticlesState with _$RecipesAndArticlesState {
  const factory RecipesAndArticlesState.initial(
    RecipesAndArticlesEnum value,
  ) = _$RecipesAndArticlesStateInitial;
}
