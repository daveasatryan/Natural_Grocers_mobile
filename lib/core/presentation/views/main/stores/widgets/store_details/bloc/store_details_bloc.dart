import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/models/user/edit_user_model.dart';
import 'package:natural_groceries/core/data/usecases/user/edit_user_usecase.dart';
import 'package:natural_groceries/core/data/utilities/storage/preferences_manager.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/bloc/store_details_event.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/bloc/store_details_state.dart';

@injectable
class StoreDetailsBloc extends Bloc<StoreDetailsEvent, StoreDetailsState> {
  StoreDetailsBloc(this.editUserUseCase) : super(const StoreDetailsState.initial()) {
    on<SetAsPreferredStore>(_onSetAsPreferredStore);
  }

  final EditUserUseCase editUserUseCase;

  void _onSetAsPreferredStore(SetAsPreferredStore event, Emitter<StoreDetailsState> emit) async {
    emit(const StoreDetailsState.loading());

    final response = await editUserUseCase(
      EditUserModel(userId: PreferencesManager.user?.uid, preferredStore: event.nid),
    );

    response.when(
      success: (data) => emit(StoreDetailsState.success(data?.result)),
      error: (msg) => emit(StoreDetailsState.error(msg)),
    );
  }
}
