import 'package:dio/dio.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/user/edit_user_model.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

/// Retrofit abstract App ApiClient
@RestApi()
abstract class UserApi {
  /// Factory constructor
  factory UserApi(
    Dio dio, {
    String baseUrl,
  }) = _UserApi;

  @GET('/api/user/{uid}')
  Future<HttpResponse<BaseModel<UserModel>>> getUserInfo(@Path('uid') String? uid);

  @PUT('/api/user/edit')
  Future<HttpResponse<BaseModel<UserModel>>> editUser(@Body() EditUserModel body);
}
