import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/usecases/content/get_offers_usecase.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/coupons/bloc/coupons_event.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/coupons/bloc/coupons_state.dart';

@injectable
class CouponsBloc extends Bloc<CouponsEvent, CouponsState> {
  CouponsBloc(this._getOffers) : super(const CouponsState.loading()) {
    on<GetCoupons>(
      (event, emit) async {
        (await _getOffers(event.type)).when(
          success: (data) => emit(CouponsState.success(data?.result ?? [])),
          error: (msg) => emit(const CouponsState.success([])),
        );
      },
    );
  }

  final GetOffersUsecase _getOffers;
}
