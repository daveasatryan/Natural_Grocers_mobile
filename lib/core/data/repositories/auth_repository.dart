import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/data_sources/auth_data_source.dart';
import 'package:natural_groceries/core/data/models/auth/sign_in_model.dart';
import 'package:natural_groceries/core/data/models/auth/sign_up_model.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';

@injectable
class AuthRepository {
  AuthRepository(this.dataSource);

  final AuthDataSource dataSource;

  Future<BaseResponse<BaseModel<UserModel>>> createUser(SignUpModel body) =>
      dataSource.createUser(body);

  Future<BaseResponse<BaseModel<UserModel>>> signIn(SignInModel body) => dataSource.signIn(body);
}
