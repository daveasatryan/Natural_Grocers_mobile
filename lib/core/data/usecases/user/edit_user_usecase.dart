import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/user/edit_user_model.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';
import 'package:natural_groceries/core/data/repositories/user_repository.dart';

@injectable
class EditUserUseCase {
  EditUserUseCase({
    required this.repository,
  });

  final UserRepository repository;

  Future<BaseResponse<BaseModel<UserModel>>> call(EditUserModel body) =>
      repository.editUser(body);
}
