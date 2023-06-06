import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/dashboard/transactions/loyalty_model.dart';
import 'package:natural_groceries/core/data/models/dashboard/transactions/offer_model.dart';
import 'package:natural_groceries/core/data/utilities/date_utilities.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    @JsonKey(name: 'basketId') String? basketId,
    @JsonKey(name: 'posId') int? posId,
    @JsonKey(name: 'storeId') int? storeId,
    @JsonKey(name: 'transactionDateTime') String? transactionDateTime,
    @JsonKey(name: 'transactionId') int? transactionId,
    @JsonKey(name: 'transactionTotalAmount') double? transactionTotalAmount,
    @JsonKey(name: 'transactionStatus') String? transactionStatus,
    @JsonKey(name: 'offers') List<OfferModel>? offers,
    @JsonKey(name: 'loyalty') List<LoyaltyModel>? loyalty,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, Object?> json) => _$TransactionModelFromJson(json);
}

extension TransactionModelExt on TransactionModel {
  String get date => DateUtilities.printDateWith(DateTime.parse(transactionDateTime ?? ''));
}
