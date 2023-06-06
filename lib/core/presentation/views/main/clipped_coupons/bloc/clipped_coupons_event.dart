import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/clipped_page_type.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';

part 'clipped_coupons_event.freezed.dart';

@freezed
class ClippedCouponsEvent with _$ClippedCouponsEvent {
  const factory ClippedCouponsEvent.changePage(ClippedPageType page) = ChangeClippedPage;

  const factory ClippedCouponsEvent.changeListViewType({required ListViewType type}) =
      ChangeClippedListViewType;
}
