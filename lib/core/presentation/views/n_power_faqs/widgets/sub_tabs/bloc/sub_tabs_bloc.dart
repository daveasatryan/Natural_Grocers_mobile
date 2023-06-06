import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/presentation/views/n_power_faqs/widgets/sub_tabs/bloc/sub_tabs_event.dart';
import 'package:natural_groceries/core/presentation/views/n_power_faqs/widgets/sub_tabs/bloc/sub_tabs_state.dart';


@injectable
class SubTabsBloc extends Bloc<SubTabsEvent, SubTabsState> {
  SubTabsBloc() : super(const SubTabsState.initial()) {
    on<ToggleExpansion>(_onToggleExpansion);
  }

  void _onToggleExpansion(ToggleExpansion event, Emitter<SubTabsState> emit) {
    emit(SubTabsState.initial(expandedIndex: event.index));
  }
}
