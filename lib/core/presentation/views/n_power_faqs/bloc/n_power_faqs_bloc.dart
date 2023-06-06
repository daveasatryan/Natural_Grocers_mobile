import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/n_power_faqs_enum.dart';
import 'package:natural_groceries/core/data/models/faqs/faqs_model.dart';
import 'package:natural_groceries/core/data/usecases/content/get_faqs_usecase.dart';
import 'package:natural_groceries/core/presentation/views/n_power_faqs/bloc/n_power_faqs_event.dart';
import 'package:natural_groceries/core/presentation/views/n_power_faqs/bloc/n_power_faqs_state.dart';

@injectable
class NPowerFaqsBloc extends Bloc<NPowerFaqsEvent, NPowerFaqsState> {
  NPowerFaqsBloc(this.getFaqsUseCase) : super(const NPowerFaqsState.loading()) {
    on<GetFaqs>(_onGetFaqs);
    on<ChangeTab>(_onChangeTab);
  }

  FaqsModel? faqsModel;

  final GetFaqsUseCase getFaqsUseCase;
  NPowerFaqsEnum nPowerFaqsEnum = NPowerFaqsEnum.account;

  void _onGetFaqs(GetFaqs event, Emitter<NPowerFaqsState> emit) async {
    final response = await getFaqsUseCase();

    response.when(
      success: (data) {
        faqsModel = data?.result;
        emit(NPowerFaqsState.initial(nPowerFaqsEnum: nPowerFaqsEnum, faqs: faqsModel));
      },
      error: (msg) => emit(NPowerFaqsState.error(msg)),
    );
  }

  void _onChangeTab(ChangeTab event, Emitter<NPowerFaqsState> emit) {
    nPowerFaqsEnum = event.nPowerFaqsEnum;
    emit(NPowerFaqsState.initial(nPowerFaqsEnum: nPowerFaqsEnum, faqs: faqsModel));
  }
}
