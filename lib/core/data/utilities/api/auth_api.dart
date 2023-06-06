import 'package:dio/dio.dart';
import 'package:natural_groceries/core/data/models/auth/sign_in_model.dart';
import 'package:natural_groceries/core/data/models/auth/sign_up_model.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

/// Retrofit abstract App ApiClient
@RestApi()
abstract class AuthApi {
  /// Factory constructor
  factory AuthApi(
    Dio dio, {
    String baseUrl,
  }) = _AuthApi;

  @POST('/api/user')
  Future<HttpResponse<BaseModel<UserModel>>> createUser({
    @Body() required SignUpModel body,
  });

  @POST('/api/user/login')
  Future<HttpResponse<BaseModel<UserModel>>> signIn({
    @Body() required SignInModel body,
  });
}
