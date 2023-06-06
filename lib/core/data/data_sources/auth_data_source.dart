import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/data_sources/base_data_source.dart';
import 'package:natural_groceries/core/data/models/auth/sign_in_model.dart';
import 'package:natural_groceries/core/data/models/auth/sign_up_model.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';
import 'package:natural_groceries/core/data/utilities/api/api.dart';
import 'package:natural_groceries/core/data/utilities/api/auth_api.dart';

@injectable
class AuthDataSource with BaseDataSource {
  AuthDataSource(Api api) {
    this.api = api.auth;
  }
  late final AuthApi api;
  Future<BaseResponse<BaseModel<UserModel>>> createUser(SignUpModel body) =>
      getResult(() => api.createUser(body: body));

  Future<BaseResponse<BaseModel<UserModel>>> signIn(SignInModel body) =>
      getResult(() => api.signIn(body: body));
}
