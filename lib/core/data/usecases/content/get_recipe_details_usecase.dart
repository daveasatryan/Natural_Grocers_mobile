import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/recipes/recipes_model.dart';
import 'package:natural_groceries/core/data/repositories/content_repository.dart';

@injectable
class GetRecipeDetailsUseCase {
  GetRecipeDetailsUseCase({
    required this.repository,
  });

  final ContentRepository repository;
  Future<BaseResponse<BaseModel<List<RecipesModel>>>> call(String? nid) =>
      repository.getRecipeDetails(nid);
}
