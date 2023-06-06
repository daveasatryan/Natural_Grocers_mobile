import 'package:bloc/bloc.dart';
import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/usecases/content/get_store_events_usecase.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/widgets/store_events/bloc/store_events_event.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/widgets/store_events/bloc/store_events_state.dart';

@injectable
class StoreEventsBloc extends Bloc<StoreEventsEvent, StoreEventsState> {
  StoreEventsBloc(this.getStoreEventsUsecase) : super(const StoreEventsState.loading()) {
    on<GetEvents>((event, emit) async {
      (await getStoreEventsUsecase(event.storeId)).when(
        success: (data) {
          if (data?.result.isNullOrEmpty() ?? false) {
            emit(const StoreEventsState.error('No Events available'));
            return;
          }
          emit(StoreEventsState.success(data?.result ?? []));
        },
        error: (msg) {
          emit(const StoreEventsState.error('No Events available'));
        },
      );
    });
  }

  final GetStoreEventsUsecase getStoreEventsUsecase;
}
