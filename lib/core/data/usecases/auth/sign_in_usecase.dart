import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/models/auth/sign_in_model.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';
import 'package:natural_groceries/core/data/repositories/auth_repository.dart';

@injectable
class SignInUsecase {
  SignInUsecase({required this.repository});

  final AuthRepository repository;
  Future<BaseResponse<BaseModel<UserModel>>> call(SignInModel body) => repository.signIn(body);
}
