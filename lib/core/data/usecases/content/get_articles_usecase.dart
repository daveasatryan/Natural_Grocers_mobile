import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/models/articles/article_model.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/repositories/content_repository.dart';

@injectable
class GetArticlesUseCase {
  GetArticlesUseCase({
    required this.repository,
  });

  final ContentRepository repository;
  Future<BaseResponse<BaseModel<List<ArticleModel>>>> call(Map<String, dynamic> queries) => repository.getArticles(queries);
}
