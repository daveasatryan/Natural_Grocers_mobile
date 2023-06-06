import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/recipe_filter_options_view_enum.dart';
import 'package:natural_groceries/core/data/enums/recipe_filters_enum.dart';
import 'package:natural_groceries/core/data/models/filters/filters_model.dart';
import 'package:natural_groceries/core/data/models/filters/local_filter_model.dart';
import 'package:natural_groceries/core/data/usecases/content/get_recipe_course_usecase.dart';
import 'package:natural_groceries/core/data/usecases/content/get_recipe_dietary_preference_usecase.dart';
import 'package:natural_groceries/core/data/usecases/content/get_recipe_dish_usecase.dart';
import 'package:natural_groceries/core/presentation/views/recipe_filters/widgets/bloc/recipe_filter_widget_event.dart';
import 'package:natural_groceries/core/presentation/views/recipe_filters/widgets/bloc/recipe_filter_widget_state.dart';

@injectable
class RecipeFilterWidgetBloc extends Bloc<RecipeFilterWidgetEvent, RecipeFilterWidgetState> {
  RecipeFilterWidgetBloc(
    this.getRecipeCourseUseCase,
    this.getRecipeDishUseCase,
    this.getRecipeDietaryPreferenceUseCase,
  ) : super(const RecipeFilterWidgetState.success(filtersMap: {})) {
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

    multipleSelectedFilters.forEach((key, value) => result[key.queryName] = value.map((e) => e.tid ?? '').toList());
    singleSelectedFilters.forEach((key, value) => result[key.queryName] = [value.tid ?? '']);

    return result;
  }

  final GetRecipeCourseUseCase getRecipeCourseUseCase;
  final GetRecipeDishUseCase getRecipeDishUseCase;
  final GetRecipeDietaryPreferenceUseCase getRecipeDietaryPreferenceUseCase;

  RecipeFiltersEnum currentExpandedFilter = RecipeFiltersEnum.sort;

  Map<RecipeFiltersEnum, List<FiltersModel>> filters = {};

  Map<RecipeFiltersEnum, List<FiltersModel>> multipleSelectedFilters = {};
  Map<RecipeFiltersEnum, FiltersModel> singleSelectedFilters = {};

  LocalFilterModelHelper localRecipeFiltersHelper = LocalFilterModelHelper();

  void _onGetFilters(GetFilters event, Emitter<RecipeFilterWidgetState> emit) async {
    currentExpandedFilter = event.recipeFiltersEnum;
    if (event.recipeFiltersEnum == RecipeFiltersEnum.sort) {
      filters[event.recipeFiltersEnum] = localRecipeFiltersHelper.getFilters.first.filters;

      emit(RecipeFilterWidgetState.success(filtersMap: filters));

      return;
    } else if (event.recipeFiltersEnum == RecipeFiltersEnum.order) {
      filters[event.recipeFiltersEnum] = localRecipeFiltersHelper.getFilters[1].filters;
      emit(RecipeFilterWidgetState.success(filtersMap: filters));
      return;
    } else if (event.recipeFiltersEnum == RecipeFiltersEnum.favorites) {
      filters[event.recipeFiltersEnum] = localRecipeFiltersHelper.getFilters[2].filters;
      emit(RecipeFilterWidgetState.success(filtersMap: filters));
      return;
    } else if (event.recipeFiltersEnum == RecipeFiltersEnum.course) {
      if (filters[event.recipeFiltersEnum] != null) {
        emit(RecipeFilterWidgetState.success(filtersMap: filters));
        return;
      }

      emit(const RecipeFilterWidgetState.loading());
      final response = await getRecipeCourseUseCase();

      response.when(
        success: (data) {
          filters[event.recipeFiltersEnum] = data?.result ?? [];
          emit(RecipeFilterWidgetState.success(filtersMap: filters));
        },
        error: (msg) => emit(RecipeFilterWidgetState.error(msg)),
      );

      return;
    } else if (event.recipeFiltersEnum == RecipeFiltersEnum.mainIngredient) {
      if (filters[event.recipeFiltersEnum] != null) {
        emit(RecipeFilterWidgetState.success(filtersMap: filters));
        return;
      }

      emit(const RecipeFilterWidgetState.loading());
      final response = await getRecipeDishUseCase();

      response.when(
        success: (data) {
          filters[event.recipeFiltersEnum] = data?.result ?? [];
          emit(RecipeFilterWidgetState.success(filtersMap: filters));
        },
        error: (msg) => emit(RecipeFilterWidgetState.error(msg)),
      );

      return;
    } else if (event.recipeFiltersEnum == RecipeFiltersEnum.dietaryPreference) {
      if (filters[event.recipeFiltersEnum] != null) {
        emit(RecipeFilterWidgetState.success(filtersMap: filters));

        return;
      }

      emit(const RecipeFilterWidgetState.loading());
      final response = await getRecipeDietaryPreferenceUseCase();

      response.when(
        success: (data) {
          filters[event.recipeFiltersEnum] = data?.result ?? [];
          emit(RecipeFilterWidgetState.success(filtersMap: filters));
        },
        error: (msg) => emit(RecipeFilterWidgetState.error(msg)),
      );

      return;
    }
  }

  void _onSelectFilter(SelectFilter event, Emitter<RecipeFilterWidgetState> emit) {
    if (event.viewType == FilterOptionsViewType.radio) {
      singleSelectedFilters[event.recipeFiltersEnum] = event.filter;
    } else {
      if (multipleSelectedFilters.containsKey(event.recipeFiltersEnum)) {
        if (multipleSelectedFilters[event.recipeFiltersEnum]?.contains(event.filter) == true) {
          multipleSelectedFilters[event.recipeFiltersEnum]?.remove(event.filter);
          if (multipleSelectedFilters[event.recipeFiltersEnum]?.isEmpty == true) {
            multipleSelectedFilters.clear();
          }
        } else {
          multipleSelectedFilters[event.recipeFiltersEnum]?.add(event.filter);
        }
      } else {
        multipleSelectedFilters[event.recipeFiltersEnum] = [event.filter];
      }
    }

    emit(RecipeFilterWidgetState.success(filtersMap: filters));
  }

  void _onClearFilters(ClearFilters event, Emitter<RecipeFilterWidgetState> emit) {
    allFilters.clear();
    singleSelectedFilters.clear();
    multipleSelectedFilters.clear();

    emit(RecipeFilterWidgetState.success(filtersMap: filters));
  }
}
