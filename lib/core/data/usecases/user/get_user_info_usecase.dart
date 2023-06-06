import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';
import 'package:natural_groceries/core/data/repositories/user_repository.dart';

@injectable
class GetUserInfoUseCase {
  GetUserInfoUseCase({
    required this.repository,
  });

  final UserRepository repository;

  Future<BaseResponse<BaseModel<UserModel>>> call(String? uid) => repository.getUserInfo(uid);
}
