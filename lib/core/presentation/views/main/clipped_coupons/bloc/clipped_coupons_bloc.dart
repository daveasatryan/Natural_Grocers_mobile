import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/clipped_page_type.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/presentation/views/main/clipped_coupons/bloc/clipped_coupons_event.dart';
import 'package:natural_groceries/core/presentation/views/main/clipped_coupons/bloc/clipped_coupons_state.dart';

@injectable
class ClippedCouponBloc extends Bloc<ClippedCouponsEvent, ClippedCouponsState> {
  ClippedCouponBloc() : super(const ClippedCouponsState.currentPage(ClippedPageType.loaded)) {
    on<ChangeClippedPage>((event, emit) => emit(ClippedCouponsState.currentPage(event.page)));
    on<ChangeClippedListViewType>((event, emit) {
      findClippedListType = event.type;
      emit(ClippedCouponsState.currentPage(state.page));
    });
  }

  ListViewType findClippedListType = ListViewType.mapView;
}
