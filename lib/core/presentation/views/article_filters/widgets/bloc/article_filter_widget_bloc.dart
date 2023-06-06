import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/article_filters_enum.dart';
import 'package:natural_groceries/core/data/enums/recipe_filter_options_view_enum.dart';
import 'package:natural_groceries/core/data/models/filters/filters_model.dart';
import 'package:natural_groceries/core/data/models/filters/local_filter_model.dart';
import 'package:natural_groceries/core/data/usecases/content/get_article_dietary_supplements_usecase.dart';
import 'package:natural_groceries/core/data/usecases/content/get_article_food_topics_usecase.dart';
import 'package:natural_groceries/core/data/usecases/content/get_article_health_protocols_usecase.dart';
import 'package:natural_groceries/core/data/usecases/content/get_article_health_topics_usecase.dart';
import 'package:natural_groceries/core/data/usecases/content/get_article_sustainable_foods_usecase.dart';
import 'package:natural_groceries/core/presentation/views/article_filters/widgets/bloc/article_filter_widget_event.dart';
import 'package:natural_groceries/core/presentation/views/article_filters/widgets/bloc/article_filter_widget_state.dart';

@injectable
class ArticleFilterWidgetBloc extends Bloc<ArticleFilterWidgetEvent, ArticleFilterWidgetState> {
  ArticleFilterWidgetBloc(
    this.getArticleDietarySupplementsUseCase,
    this.getArticleFoodTopicsUseCase,
    this.getArticleHealthProtocolsUseCase,
    this.getArticleHealthTopicsUseCase,
    this.getArticleSustainableFoodUseCase,
  ) : super(const ArticleFilterWidgetState.success(filtersMap: {})) {
    on<GetFilters>(_onGetFilters);
    on<SelectFilter>(_onSelectFilter);
    on<ClearFilters>(_onClearFilters);
  }

  List<FiltersModel> get allFilters => [
        ...singleSelectedFilters.values,
        ...multipleSelectedFilters.values.expand((element) => element)
      ];

  Map<String, List<String>> get allFiltersMap {
    final Map<String, List<String>> result = {};

    multipleSelectedFilters
        .forEach((key, value) => result[key.queryName] = value.map((e) => e.tid ?? '').toList());
    singleSelectedFilters.forEach((key, value) => result[key.queryName] = [value.tid ?? '']);

    return result;
  }

  final GetArticleDietarySupplementsUseCase getArticleDietarySupplementsUseCase;
  final GetArticleFoodTopicsUseCase getArticleFoodTopicsUseCase;
  final GetArticleHealthProtocolsUseCase getArticleHealthProtocolsUseCase;
  final GetArticleHealthTopicsUseCase getArticleHealthTopicsUseCase;
  final GetArticleSustainableFoodUseCase getArticleSustainableFoodUseCase;

  ArticleFiltersEnum currentExpandedFilter = ArticleFiltersEnum.sort;

  Map<ArticleFiltersEnum, List<FiltersModel>> filters = {};

  Map<ArticleFiltersEnum, List<FiltersModel>> multipleSelectedFilters = {};
  Map<ArticleFiltersEnum, FiltersModel> singleSelectedFilters = {};

  LocalFilterModelHelper localRecipeFiltersHelper = LocalFilterModelHelper();

  void _onGetFilters(GetFilters event, Emitter<ArticleFilterWidgetState> emit) async {
    currentExpandedFilter = event.articleFiltersEnum;
    if (event.articleFiltersEnum == ArticleFiltersEnum.sort) {
      filters[event.articleFiltersEnum] = localRecipeFiltersHelper.getFilters.first.filters;
      emit(ArticleFilterWidgetState.success(filtersMap: filters));
      return;
    } else if (event.articleFiltersEnum == ArticleFiltersEnum.order) {
      filters[event.articleFiltersEnum] = localRecipeFiltersHelper.getFilters[1].filters;
      emit(ArticleFilterWidgetState.success(filtersMap: filters));
      return;
    } else if (event.articleFiltersEnum == ArticleFiltersEnum.favorites) {
      filters[event.articleFiltersEnum] = localRecipeFiltersHelper.getFilters[2].filters;
      emit(ArticleFilterWidgetState.success(filtersMap: filters));
      return;
    } else if (event.articleFiltersEnum == ArticleFiltersEnum.healthProtocol) {
      if (filters[event.articleFiltersEnum] != null) {
        emit(ArticleFilterWidgetState.success(filtersMap: filters));
        return;
      }

      emit(const ArticleFilterWidgetState.loading());
      final response = await getArticleHealthProtocolsUseCase();

      response.when(
        success: (data) {
          filters[event.articleFiltersEnum] = data?.result ?? [];
          emit(ArticleFilterWidgetState.success(filtersMap: filters));
        },
        error: (msg) => emit(ArticleFilterWidgetState.error(msg)),
      );

      return;
    } else if (event.articleFiltersEnum == ArticleFiltersEnum.dietarySupplements) {
      if (filters[event.articleFiltersEnum] != null) {
        emit(ArticleFilterWidgetState.success(filtersMap: filters));
        return;
      }

      emit(const ArticleFilterWidgetState.loading());
      final response = await getArticleDietarySupplementsUseCase();

      response.when(
        success: (data) {
          filters[event.articleFiltersEnum] = data?.result ?? [];
          emit(ArticleFilterWidgetState.success(filtersMap: filters));
        },
        error: (msg) => emit(ArticleFilterWidgetState.error(msg)),
      );

      return;
    } else if (event.articleFiltersEnum == ArticleFiltersEnum.foodTopics) {
      if (filters[event.articleFiltersEnum] != null) {
        emit(ArticleFilterWidgetState.success(filtersMap: filters));

        return;
      }

      emit(const ArticleFilterWidgetState.loading());
      final response = await getArticleFoodTopicsUseCase();

      response.when(
        success: (data) {
          filters[event.articleFiltersEnum] = data?.result ?? [];
          emit(ArticleFilterWidgetState.success(filtersMap: filters));
        },
        error: (msg) => emit(ArticleFilterWidgetState.error(msg)),
      );

      return;
    } else if (event.articleFiltersEnum == ArticleFiltersEnum.healthTopics) {
      if (filters[event.articleFiltersEnum] != null) {
        emit(ArticleFilterWidgetState.success(filtersMap: filters));

        return;
      }

      emit(const ArticleFilterWidgetState.loading());
      final response = await getArticleHealthTopicsUseCase();

      response.when(
        success: (data) {
          filters[event.articleFiltersEnum] = data?.result ?? [];
          emit(ArticleFilterWidgetState.success(filtersMap: filters));
        },
        error: (msg) => emit(ArticleFilterWidgetState.error(msg)),
      );

      return;
    } else if (event.articleFiltersEnum == ArticleFiltersEnum.sustainableFood) {
      if (filters[event.articleFiltersEnum] != null) {
        emit(ArticleFilterWidgetState.success(filtersMap: filters));

        return;
      }

      emit(const ArticleFilterWidgetState.loading());
      final response = await getArticleSustainableFoodUseCase();

      response.when(
        success: (data) {
          filters[event.articleFiltersEnum] = data?.result ?? [];
          emit(ArticleFilterWidgetState.success(filtersMap: filters));
        },
        error: (msg) => emit(ArticleFilterWidgetState.error(msg)),
      );

      return;
    }
  }

  void _onSelectFilter(SelectFilter event, Emitter<ArticleFilterWidgetState> emit) {
    if (event.viewType == FilterOptionsViewType.radio) {
      singleSelectedFilters[event.articleFiltersEnum] = event.filter;
    } else {
      if (multipleSelectedFilters.containsKey(event.articleFiltersEnum)) {
        if (multipleSelectedFilters[event.articleFiltersEnum]?.contains(event.filter) == true) {
          multipleSelectedFilters[event.articleFiltersEnum]?.remove(event.filter);
          if (multipleSelectedFilters[event.articleFiltersEnum]?.isEmpty == true) {
            multipleSelectedFilters.clear();
          }
        } else {
          multipleSelectedFilters[event.articleFiltersEnum]?.add(event.filter);
        }
      } else {
        multipleSelectedFilters[event.articleFiltersEnum] = [event.filter];
      }
    }

    emit(ArticleFilterWidgetState.success(filtersMap: filters));
  }

  void _onClearFilters(ClearFilters event, Emitter<ArticleFilterWidgetState> emit) {
    allFilters.clear();
    singleSelectedFilters.clear();
    multipleSelectedFilters.clear();

    emit(ArticleFilterWidgetState.success(filtersMap: filters));
  }
}
