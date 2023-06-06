import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/dashboard/transactions/transaction_model.dart';
import 'package:natural_groceries/core/data/repositories/content_repository.dart';

@injectable
class GetTransactionDetailsUsecase {
  GetTransactionDetailsUsecase({
    required this.repository,
  });

  final ContentRepository repository;

  Future<BaseResponse<BaseModel<TransactionModel>>> call(String? basketId) =>
      repository.getTransactionDetails(basketId);
}
