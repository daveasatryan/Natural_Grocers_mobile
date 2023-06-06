import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';

part 'articles_state.freezed.dart';

@Freezed(equal: false)
class ArticlesState with _$ArticlesState {
  const factory ArticlesState.initial({
    required ListViewType viewType,
    List<int>? favoriteItems,
  }) = _$ArticlesStateInitial;

  const factory ArticlesState.loading() = _$ArticlesStateLoading;
}
