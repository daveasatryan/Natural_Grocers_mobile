import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/presentation/views/onboard/bloc/onboarding_event.dart';
import 'package:natural_groceries/core/presentation/views/onboard/bloc/onboarding_state.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState.pages(index: 0, indexPage: 1)) {
    on<nexPage>(
      (event, emit) {
        emit(
          OnboardingState.pages(
            index: event.index,
            indexPage: event.index + 1,
          ),
        );
      },
    );
  }
}
