import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/hotline_magazine_page_enum.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/bloc/hotline_magazine_event.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/bloc/hotline_magazine_state.dart';

@injectable
class HotlineMagazineBloc extends Bloc<HotlineMagazineEvent, HotlineMagazineState> {
  HotlineMagazineBloc()
      : super(const HotlineMagazineState.initial(
          index: 0,
          page: HotlineMagazinePageEnum.slideView,
        )) {
    on<ChangePhoto>(_onChangePhoto);
    on<ChangePage>(_onChangePage);
  }

  void _onChangePage(ChangePage event, Emitter<HotlineMagazineState> emit) {
    emit(
      HotlineMagazineState.initial(
        page: event.page,
        index: event.index ?? 0,
      ),
    );
  }

  void _onChangePhoto(ChangePhoto event, Emitter<HotlineMagazineState> emit) {
    emit(
      HotlineMagazineState.initial(
        index: event.index,
        page: HotlineMagazinePageEnum.slideView,
      ),
    );
  }
}
