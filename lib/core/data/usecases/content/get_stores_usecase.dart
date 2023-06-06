import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/repositories/content_repository.dart';

@injectable
class GetStoresUsecase {
  GetStoresUsecase({
    required this.repository,
  });

  final ContentRepository repository;

  Future<BaseResponse<BaseModel<List<StoreModel>>>> call() => repository.getStores();
}
