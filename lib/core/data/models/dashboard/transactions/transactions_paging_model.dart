import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/base/base_inmar_ice_model.dart';
import 'package:natural_groceries/core/data/models/dashboard/transactions/link_model.dart';
import 'package:natural_groceries/core/data/models/dashboard/transactions/transaction_model.dart';

part 'transactions_paging_model.freezed.dart';
part 'transactions_paging_model.g.dart';

@freezed
class TransactionsPagingModel extends BaseInmarIceModel with _$TransactionsPagingModel {
  TransactionsPagingModel._();

  @Implements<BaseInmarIceModel>()
  factory TransactionsPagingModel({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'size') int? size,
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'itemCount') int? itemCount,
    @JsonKey(name: 'pages') int? pages,
    @JsonKey(name: 'links') LinkModel? links,
    @JsonKey(name: 'items') List<TransactionModel>? items,
  }) = _TransactionsPagingModel;

  factory TransactionsPagingModel.fromJson(Map<String, Object?> json) =>
      _$TransactionsPagingModelFromJson(json);
}
