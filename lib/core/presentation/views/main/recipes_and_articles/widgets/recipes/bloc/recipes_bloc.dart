import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/data/models/recipes/recipes_model.dart';
import 'package:natural_groceries/core/data/usecases/content/get_recipes_usecase.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/recipes/bloc/recipes_event.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/recipes/bloc/recipes_state.dart';

@injectable
class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  RecipesBloc(this.getRecipesUseCase) : super(const RecipesState.loading()) {
    on<GetRecipes>(_onGetRecipes);
    on<ToggleView>(_onToggleView);
    on<AddToFavorites>(_onAddToFavorites);
  }

  final GetRecipesUseCase getRecipesUseCase;

  List<RecipesModel> recipes = [];
  List<int> favorites = [];
  ListViewType viewType = ListViewType.listView;

  void _onGetRecipes(GetRecipes event, Emitter<RecipesState> emit) async {
    emit(const RecipesState.loading());
    final response = await getRecipesUseCase(event.queryMap ?? {});

    response.when(success: (data) {
      recipes = data?.result ?? [];
      emit(RecipesState.initial(viewType: viewType));
    }, error: (msg) {
      emit(RecipesState.initial(viewType: viewType));
    });
  }

  void _onToggleView(ToggleView event, Emitter<RecipesState> emit) {
    viewType = event.viewType;

    emit(RecipesState.initial(viewType: viewType));
  }

  void _onAddToFavorites(AddToFavorites event, Emitter<RecipesState> emit) {
    if (favorites.contains(event.itemId)) {
      favorites.remove(event.itemId);
    } else {
      favorites.add(event.itemId);
    }

    emit(RecipesState.initial(favoriteItems: favorites, viewType: viewType));
  }
}
