import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/presentation/views/main/meal_deals/bloc/meal_deals_event.dart';
import 'package:natural_groceries/core/presentation/views/main/meal_deals/bloc/meal_deals_state.dart';

@injectable
class MealDealsBloc extends Bloc<MealDealsEvent, MealDealsState> {
  MealDealsBloc() : super(const MealDealsState.initial(view: ListViewType.listView)) {
    on<ChangeView>(_onChangeView);
  }

  void _onChangeView(ChangeView event, Emitter<MealDealsState> emit) {
    emit(MealDealsState.initial(view: event.view));
  }
}
