import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';

part 'articles_event.freezed.dart';

@freezed
class ArticlesEvent with _$ArticlesEvent {
  const factory ArticlesEvent.getArticles({
    Map<String, dynamic>? queryMap,
  }) = GetArticles;

  const factory ArticlesEvent.toggleView({
    required ListViewType viewType,
  }) = ToggleView;

  const factory ArticlesEvent.addToFavorites({
    required int itemId,
  }) = AddToFavorites;
}
