import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/recipes_and_articles_enum.dart';

part 'recipes_and_articles_event.freezed.dart';

@freezed
class RecipesAndArticlesEvent with _$RecipesAndArticlesEvent {
  const factory RecipesAndArticlesEvent.changeTab(RecipesAndArticlesEnum value) = ChangeTab;
}
