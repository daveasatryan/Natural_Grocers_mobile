import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/data_sources/user_data_source.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/user/edit_user_model.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';

@injectable
class UserRepository {
  UserRepository(this.dataSource);

  final UserDataSource dataSource;

  Future<BaseResponse<BaseModel<UserModel>>> getUserInfo(String? uid) =>
      dataSource.getUserInfo(uid);

  Future<BaseResponse<BaseModel<UserModel>>> editUser(EditUserModel body) =>
      dataSource.editUser(body);
}
