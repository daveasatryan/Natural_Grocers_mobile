import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/data/models/articles/article_model.dart';
import 'package:natural_groceries/core/data/usecases/content/get_articles_usecase.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/articles/bloc/articles_event.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/articles/bloc/articles_state.dart';

@injectable
class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc(this.getArticlesUseCase) : super(const ArticlesState.loading()) {
    on<GetArticles>(_onGetArticles);
    on<ToggleView>(_onToggleView);
    on<AddToFavorites>(_onAddToFavorites);
  }

  final GetArticlesUseCase getArticlesUseCase;

  List<ArticleModel> articles = [];
  List<int> favorites = [];
  ListViewType viewType = ListViewType.listView;

  void _onGetArticles(GetArticles event, Emitter<ArticlesState> emit) async {
    emit(const ArticlesState.loading());
    final response = await getArticlesUseCase(event.queryMap ?? {});

    response.when(
      success: (data) {
        articles = data?.result ?? [];
        emit(ArticlesState.initial(viewType: viewType));
      },
      error: (msg) {
        emit(ArticlesState.initial(viewType: viewType));
      },
    );
  }

  void _onToggleView(ToggleView event, Emitter<ArticlesState> emit) {
    emit(ArticlesState.initial(viewType: event.viewType));
  }

  void _onAddToFavorites(AddToFavorites event, Emitter<ArticlesState> emit) {
    if (favorites.contains(event.itemId)) {
      favorites.remove(event.itemId);
    } else {
      favorites.add(event.itemId);
    }

    emit(ArticlesState.initial(favoriteItems: favorites, viewType: viewType));
  }
}
