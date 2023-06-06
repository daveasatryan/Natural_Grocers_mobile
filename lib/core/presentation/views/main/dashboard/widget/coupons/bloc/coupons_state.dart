import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/dashboard/coupons/coupon_model.dart';

part 'coupons_state.freezed.dart';

@freezed
class CouponsState with _$CouponsState {
  const factory CouponsState.loading() = _$CouponsStateLoading;

  const factory CouponsState.success(List<CouponModel> offers) = _$CouponsStateSuccess;
}
