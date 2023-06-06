import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/usecases/user/get_user_info_usecase.dart';
import 'package:natural_groceries/core/presentation/views/splash/bloc/splash_event.dart';
import 'package:natural_groceries/core/presentation/views/splash/bloc/splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this.getUserInfoUseCase) : super(const SplashState.initial()) {
    on<GetUser>(_onGetUser);
  }

  final GetUserInfoUseCase getUserInfoUseCase;

  void _onGetUser(GetUser event, Emitter<SplashState> emit) async {
    final response = await getUserInfoUseCase(event.uid);

    response.when(
      success: (data) => emit(SplashState.success(user: data?.result)),
      error: (msg) => emit(SplashState.error(message: msg)),
    );
  }
}
