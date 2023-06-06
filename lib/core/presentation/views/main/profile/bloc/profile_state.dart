import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';

part 'profile_state.freezed.dart';

@Freezed(equal: false)
class ProfileState with _$ProfileState {
  const factory ProfileState.initial({
    required ListViewType viewType,
    List<int>? favoriteItems,
  }) = _$ProfileStateStateInitial;

  const factory ProfileState.getUserSuccess({required UserModel? user}) =
      _$ProfileStateGetUserSuccess;

  const factory ProfileState.error({
    required String msg,
  }) = _$ProfileStateError;
}

extension ProfileStateExt on ProfileState {
  bool buildWhen() => when(
        initial: (_, __) => true,
        getUserSuccess: (_) => false,
        error: (_) => false,
      );

  bool listenWhen() => !buildWhen();
}
