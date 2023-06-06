import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/article_filters_enum.dart';
import 'package:natural_groceries/core/data/models/filters/filters_model.dart';

part 'article_filter_widget_state.freezed.dart';

@Freezed(equal: false)
class ArticleFilterWidgetState with _$ArticleFilterWidgetState {

  const factory ArticleFilterWidgetState.loading() = _$ArticleFilterWidgetStateLoading;

  const factory ArticleFilterWidgetState.success({
    required Map<ArticleFiltersEnum, List<FiltersModel>> filtersMap,
  }) = _$ArticleFilterWidgetStateSuccess;

  const factory ArticleFilterWidgetState.error(String msg) = _$ArticleFilterWidgetStateError;
}

extension ArticleFilterWidgetStateExt on ArticleFilterWidgetState {
  bool buildWhen() => when(
    success: (_) => true,
    loading: () => true,
    error: (_) => false,
  );

  bool listenWhen() => !buildWhen();
}
