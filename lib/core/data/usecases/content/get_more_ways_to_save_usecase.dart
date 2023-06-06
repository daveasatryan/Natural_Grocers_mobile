import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/more_ways_to_save/more_ways_to_save_model.dart';
import 'package:natural_groceries/core/data/repositories/content_repository.dart';

@injectable
class GetMoreWaysToSaveUseCase {
  GetMoreWaysToSaveUseCase({
    required this.repository,
  });

  final ContentRepository repository;

  Future<BaseResponse<BaseModel<List<MoreWaysToSaveModel>>>> call() =>
      repository.getMoreWaysToSave();
}
