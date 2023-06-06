import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';

part 'store_details_state.freezed.dart';

@freezed
class StoreDetailsState with _$StoreDetailsState {

  const factory StoreDetailsState.initial() = _$StoreDetailsStateInitial;

  const factory StoreDetailsState.loading() = _$StoreDetailsStateLoading;

  const factory StoreDetailsState.success(UserModel? userModel) = _$StoreDetailsStateSuccess;

  const factory StoreDetailsState.error(String msg) = _$StoreDetailsStateError;

}

extension StoreDetailsStateExt on StoreDetailsState {

  bool buildWhen() => when(
    initial: () => true,
    success: (_) => false,
    error: (_) => false,
    loading: () => false,
  );

  bool listenWhen() => !buildWhen();
}

