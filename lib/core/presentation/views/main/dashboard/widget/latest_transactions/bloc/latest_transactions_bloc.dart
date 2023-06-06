import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/usecases/content/get_transactions_usecase.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/latest_transactions/bloc/latest_transactions_event.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/latest_transactions/bloc/latest_transactions_state.dart';

@injectable
class LatestTransactionsBloc extends Bloc<LatestTransactionsEvent, LatestTransactionsState> {
  LatestTransactionsBloc(this._getTransactions) : super(const LatestTransactionsState.loading()) {
    on<GetTransactions>((event, emit) async {
      (await _getTransactions()).when(
        success: (data) {
          emit(LatestTransactionsState.success(data: data?.result?.items ?? []));
        },
        error: (message) => emit(LatestTransactionsState.error(msg: message)),
      );
    });
  }

  final GetTransactionsUsecase _getTransactions;
}
