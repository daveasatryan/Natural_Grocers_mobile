import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/clipped_page_type.dart';

part 'clipped_coupons_state.freezed.dart';

@Freezed(equal: false)
class ClippedCouponsState with _$ClippedCouponsState {
  const factory ClippedCouponsState.currentPage(ClippedPageType page) =
      _$ClippedCouponsStateLoading;
}
