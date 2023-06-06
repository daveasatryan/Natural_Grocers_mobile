import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/data/enums/store_page_type.dart';

part 'stores_event.freezed.dart';

@freezed
class StoresEvent with _$StoresEvent {
  const factory StoresEvent.changePage(StorePageType page) = ChangePage;

  const factory StoresEvent.changeListViewType({required ListViewType type}) = ChangeListViewType;

  const factory StoresEvent.getStores() = GetStores;
}
