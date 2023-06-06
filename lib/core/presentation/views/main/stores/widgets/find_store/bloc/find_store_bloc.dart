import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/find_store/bloc/find_store_event.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/find_store/bloc/find_store_state.dart';

@injectable
class FindStoreBloc extends Bloc<FindStoreEvent, FindStoreState> {
  FindStoreBloc() : super(const FindStoreState.searchStore(null)) {
    on<Search>((event, emit) => emit(FindStoreState.searchStore(event.searchKey)));
  }
}
