import 'package:bloc/bloc.dart';
import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/usecases/content/get_store_promos_usecase.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/widgets/store_promos/bloc/store_promos_event.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/widgets/store_promos/bloc/store_promos_state.dart';

@injectable
class StorePromosBloc extends Bloc<StorePromosEvent, StorePromosState> {
  StorePromosBloc(this.getStorePromosUsecase) : super(const StorePromosState.loading()) {
    on<GetPromos>((event, emit) async {
      (await getStorePromosUsecase(event.storeId)).when(
        success: (data) {
          if (data?.result.isNullOrEmpty() ?? false) {
            emit(const StorePromosState.error('No Events available'));
            return;
          }
          emit(StorePromosState.success(data?.result ?? []));
        },
        error: (msg) {
          emit(const StorePromosState.error('No Events available'));
        },
      );
    });
  }

  final GetStorePromosUsecase getStorePromosUsecase;
}
