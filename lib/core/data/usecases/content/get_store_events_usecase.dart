import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/store/store_event_model.dart';
import 'package:natural_groceries/core/data/repositories/content_repository.dart';

@injectable
class GetStoreEventsUsecase {
  GetStoreEventsUsecase({
    required this.repository,
  });

  final ContentRepository repository;
  Future<BaseResponse<BaseModel<List<StoreEventModel>>>> call(String? nid) => repository.getStoreEvents(nid);
}
