import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/preferred_store/bloc/preferred_store_event.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/preferred_store/bloc/preferred_store_state.dart';

@injectable
class PreferredStoreBloc extends Bloc<PreferredStoreEvent, PreferredStoreState> {
  PreferredStoreBloc() : super(const PreferredStoreState.loading()) {
    on<GetPreferredStore>((event, emit) async {});
  }
}
