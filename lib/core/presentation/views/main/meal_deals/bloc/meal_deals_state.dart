import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';

part 'meal_deals_state.freezed.dart';

@freezed
class MealDealsState with _$MealDealsState {
  const factory MealDealsState.initial({required ListViewType view}) = _$MealDealsStateInitial;
}
