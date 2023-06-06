import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/bottom_nav_enum.dart';

part 'bottom_nav_bar_state.freezed.dart';

@freezed
class BottomNavBarState with _$BottomNavBarState {
  const factory BottomNavBarState.initial(BottomNavEnum page) = _$BottomNavBarStateinitial;
}
