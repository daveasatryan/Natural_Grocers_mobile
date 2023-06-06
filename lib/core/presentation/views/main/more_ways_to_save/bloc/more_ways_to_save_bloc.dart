import 'package:bloc/bloc.dart';
import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/models/more_ways_to_save/more_ways_to_save_model.dart';
import 'package:natural_groceries/core/data/usecases/content/get_more_ways_to_save_usecase.dart';
import 'package:natural_groceries/core/presentation/views/main/more_ways_to_save/bloc/more_ways_to_save_event.dart';
import 'package:natural_groceries/core/presentation/views/main/more_ways_to_save/bloc/more_ways_to_save_state.dart';

@injectable
class MoreWaysToSaveBloc extends Bloc<MoreWaysToSaveEvent, MoreWaysToSaveState> {
  MoreWaysToSaveBloc(this.getMoreWaysToSaveUseCase) : super(const MoreWaysToSaveState.loading()) {
    on<GetMoreWaysToSave>(_onGetMoreWaysToSave);
  }

  final GetMoreWaysToSaveUseCase getMoreWaysToSaveUseCase;

  void _onGetMoreWaysToSave(GetMoreWaysToSave event, Emitter<MoreWaysToSaveState> emit) async {
    emit(const MoreWaysToSaveState.loading());

    final response = await getMoreWaysToSaveUseCase();

    response.when(
      success: (data) {
        List<MoreWaysToSaveModel> moreWaysToSaveList = data?.result ?? [];
        emit(
          MoreWaysToSaveState.success(
              moreWaysToSaveList: moreWaysToSaveList
                  .where((element) => element.imageUrl.isNotNullOrEmpty())
                  .toList()),
        );
      },
      error: (msg) => emit(MoreWaysToSaveState.error(msg)),
    );
  }
}
