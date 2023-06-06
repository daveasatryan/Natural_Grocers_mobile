import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';

part 'meal_deals_event.freezed.dart';

@freezed
class MealDealsEvent with _$MealDealsEvent {
  const factory MealDealsEvent.changeView({
    required ListViewType view,
  }) = ChangeView;
}
