import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_transactions_event.freezed.dart';

@freezed
class LatestTransactionsEvent with _$LatestTransactionsEvent {
  const factory LatestTransactionsEvent.getTransactions() = GetTransactions;
}
