import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/store/store_promo_model.dart';
import 'package:natural_groceries/core/data/repositories/content_repository.dart';

@injectable
class GetStorePromosUsecase {
  GetStorePromosUsecase({
    required this.repository,
  });

  final ContentRepository repository;
  Future<BaseResponse<BaseModel<List<StorePromoModel>>>> call(String? nid) => repository.getStorePromos(nid);
}
