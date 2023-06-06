import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/faqs/faqs_model.dart';
import 'package:natural_groceries/core/data/repositories/content_repository.dart';

@injectable
class GetFaqsUseCase {
  GetFaqsUseCase({
    required this.repository,
  });

  final ContentRepository repository;
  Future<BaseResponse<BaseModel<FaqsModel>>> call() => repository.getFaqs();
}
