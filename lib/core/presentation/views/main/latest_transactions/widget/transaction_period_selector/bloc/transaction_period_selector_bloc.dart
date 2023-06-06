import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/single_character_radio.dart';
import 'package:natural_groceries/core/presentation/views/main/latest_transactions/widget/transaction_period_selector/bloc/transaction_period_selector_event.dart';
import 'package:natural_groceries/core/presentation/views/main/latest_transactions/widget/transaction_period_selector/bloc/transaction_period_selector_state.dart';

@injectable
class TransactionPeriodSelectorBloc
    extends Bloc<TransactionPeriodSelectorEvent, TransactionPeriodSelectorState> {
  bool dateShow = false;

  TransactionPeriodSelectorBloc()
      : super(const TransactionPeriodSelectorState.initialRadio(
          character: SingingCharacterRadio.month,
          dateShow: false,
        )) {
    on<TogglePeriod>((event, emit) {
      if (event.character == SingingCharacterRadio.dateRange) {
        dateShow = true;
      }
      emit(
        TransactionPeriodSelectorState.initialRadio(
          character: event.character,
          dateShow: dateShow,
          startDate: event.startDate,
          endDate: event.endDate,
        ),
      );
    });
  }

  SingingCharacterRadio? character = SingingCharacterRadio.month;
}
