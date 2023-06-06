import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/usecases/content/get_transaction_details_usecase.dart';
import 'package:natural_groceries/core/presentation/views/main/transaction_details/bloc/transaction_details_event.dart';
import 'package:natural_groceries/core/presentation/views/main/transaction_details/bloc/transaction_details_state.dart';

@injectable
class TransactionDetailsBloc extends Bloc<TransactionDetailsEvent, TransactionDetailsState> {
  TransactionDetailsBloc(this._getTransactionDetails)
      : super(const TransactionDetailsState.loading()) {
    on<GetTransactionDetails>((event, emit) async {
      (await _getTransactionDetails(event.transactionId)).when(
        success: (data) => emit(TransactionDetailsState.success(data?.result)),
        error: (msg) => emit(TransactionDetailsState.error(msg: msg)),
      );
    });
  }

  final GetTransactionDetailsUsecase _getTransactionDetails;
}
