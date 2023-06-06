import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/dashboard/transactions/transactions_paging_model.dart';
import 'package:natural_groceries/core/data/repositories/content_repository.dart';

@injectable
class GetTransactionsUsecase {
  GetTransactionsUsecase({
    required this.repository,
  });

  final ContentRepository repository;

  Future<BaseResponse<BaseModel<TransactionsPagingModel>>> call({
    int? page = 1,
  }) =>
      repository.getTransactions(page);
}
