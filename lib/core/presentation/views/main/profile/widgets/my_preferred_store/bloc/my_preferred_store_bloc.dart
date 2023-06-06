import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/usecases/content/get_stores_usecase.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/widgets/my_preferred_store/bloc/my_preferred_store_event.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/widgets/my_preferred_store/bloc/my_preferred_store_state.dart';

@injectable
class MyPreferredStoreBloc extends Bloc<MyPreferredStoreEvent, MyPreferredStoreState> {
  MyPreferredStoreBloc(this.getStoresUsecase) : super(const MyPreferredStoreState.loading()) {
    on<GetStores>(_onGetStores);
  }

  final GetStoresUsecase getStoresUsecase;

  void _onGetStores(GetStores event, Emitter<MyPreferredStoreState> emit) async {
    final response = await getStoresUsecase();

    response.when(
      success: (data) => emit(MyPreferredStoreState.success(stores: data?.result)),
      error: (msg) => emit(MyPreferredStoreState.error(msg: msg)),
    );
  }
}
