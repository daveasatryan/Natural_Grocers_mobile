import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/recipes_and_articles_enum.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/bloc/recipes_and_articles_event.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/bloc/recipes_and_articles_state.dart';

@injectable
class RecipesAndArticlesBloc extends Bloc<RecipesAndArticlesEvent, RecipesAndArticlesState> {
  RecipesAndArticlesBloc()
      : super(const RecipesAndArticlesState.initial(RecipesAndArticlesEnum.recipes)) {
    on<ChangeTab>(_onChangeTab);
  }

  void _onChangeTab(ChangeTab event, Emitter<RecipesAndArticlesState> emit) {
    emit(RecipesAndArticlesState.initial(event.value));
  }
}
