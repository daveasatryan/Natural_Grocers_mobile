import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/usecases/content/get_stores_usecase.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_up_store_screen/bloc/sign_up_store_event.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_up_store_screen/bloc/sign_up_store_state.dart';

@injectable
class SignUpStoreBloc extends Bloc<SignUpStoreEvent, SignUpStoreState> {
  SignUpStoreBloc(this.getStoresUsecase) : super(const SignUpStoreState.loading()) {
    on<GetStores>(_onGetStores);
    on<ToggleListView>(_onToggleListView);
    on<Search>(_onSearch);
  }

  final GetStoresUsecase getStoresUsecase;

  List<StoreModel> stores = [];
  ListViewType listViewType = ListViewType.mapView;

  void _onGetStores(GetStores event, Emitter<SignUpStoreState> emit) async {
    emit(const SignUpStoreState.loading());

    final response = await getStoresUsecase();

    response.when(
      success: (data) {
        stores = data?.result ?? [];
        emit(
          SignUpStoreState.success(
            stores: stores,
            listViewType: listViewType,
          ),
        );
      },
      error: (msg) => emit(SignUpStoreState.error(msg: msg)),
    );
  }

  void _onToggleListView(ToggleListView event, Emitter<SignUpStoreState> emit) {
    listViewType = event.type;

    emit(SignUpStoreState.success(stores: stores, listViewType: listViewType));
  }

  void _onSearch(Search event, Emitter<SignUpStoreState> emit) {
    emit(SignUpStoreState.searchStore(event.searchKey));
    emit(
      SignUpStoreState.success(
        stores: stores,
        listViewType: listViewType,
        searchKey: event.searchKey,
      ),
    );
  }
}
