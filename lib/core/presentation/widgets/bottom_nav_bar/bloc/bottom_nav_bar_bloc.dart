import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/bottom_nav_enum.dart';
import 'package:natural_groceries/core/presentation/widgets/bottom_nav_bar/bloc/bottom_nav_bar_event.dart';
import 'package:natural_groceries/core/presentation/widgets/bottom_nav_bar/bloc/bottom_nav_bar_state.dart';

@injectable
class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(const BottomNavBarState.initial(BottomNavEnum.dashboard)) {
    on<ChangePage>(
      (event, emit) {
        emit(BottomNavBarState.initial(event.page));
      },
    );
  }

  bool isPageSelected(BottomNavEnum page) {
    return state.page == page;
  }
}
