import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/store/store_promo_model.dart';

part 'store_promos_state.freezed.dart';

@freezed
class StorePromosState with _$StorePromosState {
const factory StorePromosState.loading() = _$StorePromosStateLoading;

  const factory StorePromosState.success(List<StorePromoModel> events) = _$StorePromosStateSuccess;

  const factory StorePromosState.error(msg) = _$StorePromosStateError;

}