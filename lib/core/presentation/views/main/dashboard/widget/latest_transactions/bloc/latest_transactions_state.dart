import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/dashboard/transactions/transaction_model.dart';

part 'latest_transactions_state.freezed.dart';

@freezed
class LatestTransactionsState with _$LatestTransactionsState {
  const factory LatestTransactionsState.loading() = _$LatestTransactionsStateLoading;

  const factory LatestTransactionsState.success({required List<TransactionModel> data}) =
      _$LatestTransactionsStateSuccess;

  const factory LatestTransactionsState.error({
    required String msg,
  }) = _$LatestTransactionsStateError;
}

extension LatestTransactionsStateExt on LatestTransactionsState {
  bool buildWhen() => when(
        loading: () => true,
        success: (_) => true,
        error: (_) => false,
      );

  bool listenWhen() => !buildWhen();
}
