import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';

part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.getUserInfo({
    required String uid,
  }) = GetUserInfo;

  const factory ProfileEvent.toggleView({
    required ListViewType viewType,
  }) = ToggleViewProfile;

  const factory ProfileEvent.addToFavorites({
    required int itemId,
  }) = AddToFavoritesProfile;
}
