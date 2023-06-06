import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';

part 'sign_up_store_event.freezed.dart';

@freezed
class SignUpStoreEvent with _$SignUpStoreEvent {
  const factory SignUpStoreEvent.getStores() = GetStores;

  const factory SignUpStoreEvent.search(String? searchKey) = Search;

  const factory SignUpStoreEvent.toggleListView({
    required ListViewType type,
  }) = ToggleListView;
}
