import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/presentation/views/main/news/bloc/news_event.dart';
import 'package:natural_groceries/core/presentation/views/main/news/bloc/news_state.dart';

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(const NewsState.loading());
}
