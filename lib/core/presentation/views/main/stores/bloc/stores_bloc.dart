import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/data/enums/store_page_type.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/usecases/content/get_stores_usecase.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/bloc/stores_event.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/bloc/stores_state.dart';

@injectable
class StoresBloc extends Bloc<StoresEvent, StoresState> {
  StoresBloc(this.getStoresUsecase) : super(const StoresState.loading()) {
    on<ChangePage>((event, emit) {
      page = event.page;
      if (event.page == StorePageType.findStore && stores.isEmpty) {
        add(const StoresEvent.getStores());
        emit(StoresState.currentPage(page: page, showLoading: true));
        return;
      }
      emit(StoresState.currentPage(page: page, showLoading: false));
    });
    on<ChangeListViewType>((event, emit) {
      findStoreListType = event.type;
      emit(StoresState.currentPage(page: page, showLoading: false));
    });
    on<GetStores>((event, emit) async {
      (await getStoresUsecase()).when(
        success: (data) {
          stores = data?.result ?? [];
          emit(StoresState.currentPage(page: page, showLoading: false));
        },
        error: (msg) {
          stores = [];
          emit(StoresState.currentPage(page: page, showLoading: false));
        },
      );
    });
  }

  final GetStoresUsecase getStoresUsecase;

  ListViewType findStoreListType = ListViewType.mapView;
  StorePageType page = StorePageType.preferredStore;
  List<StoreModel> stores = [];
}
