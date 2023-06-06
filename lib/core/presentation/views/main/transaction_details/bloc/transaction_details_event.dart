import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_details_event.freezed.dart';

@freezed
class TransactionDetailsEvent with _$TransactionDetailsEvent {
  const factory TransactionDetailsEvent.getTransactionDetails(String? transactionId) =
      GetTransactionDetails;
}
