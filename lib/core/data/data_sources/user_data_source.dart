import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/data_sources/base_data_source.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/user/edit_user_model.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';
import 'package:natural_groceries/core/data/utilities/api/api.dart';
import 'package:natural_groceries/core/data/utilities/api/user_api.dart';

@injectable
class UserDataSource with BaseDataSource {
  UserDataSource(Api api) {
    this.api = api.user;
  }

  late final UserApi api;

  Future<BaseResponse<BaseModel<UserModel>>> getUserInfo(String? uid) =>
      getResult(() => api.getUserInfo(uid));

  Future<BaseResponse<BaseModel<UserModel>>> editUser(EditUserModel body) =>
      getResult(() => api.editUser(body));
}
