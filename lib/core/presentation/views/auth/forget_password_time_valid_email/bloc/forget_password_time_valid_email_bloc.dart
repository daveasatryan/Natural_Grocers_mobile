import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password_time_valid_email/bloc/forget_password_time_valid_email_event.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password_time_valid_email/bloc/forget_password_time_valid_email_state.dart';

@injectable
class ForgetPasswordTimeValidEmailBloc
    extends Bloc<ForgetPasswordTimeValidEmailEvent, ForgetPasswordTimeValidEmailState> {
  ForgetPasswordTimeValidEmailBloc() : super(const ForgetPasswordTimeValidEmailState.initial());
}
