import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/dashboard/transactions/transaction_model.dart';

part 'transaction_details_state.freezed.dart';

@freezed
class TransactionDetailsState with _$TransactionDetailsState {
  const factory TransactionDetailsState.loading() = _$TransactionDetailsStateLoading;

  const factory TransactionDetailsState.success(TransactionModel? transaction) =
      _$TransactionDetailsStateSuccess;

  const factory TransactionDetailsState.error({
    required String msg,
  }) = _$TransactionDetailsStateError;
}

extension TransactionDetailsStateExt on TransactionDetailsState {
  bool buildWhen() => when(
        loading: () => true,
        success: (_) => true,
        error: (_) => false,
      );

  bool listenWhen() => !buildWhen();
}
