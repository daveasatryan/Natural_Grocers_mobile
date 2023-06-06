import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/bottom_nav_enum.dart';

part 'bottom_nav_bar_event.freezed.dart';

@freezed
class BottomNavBarEvent with _$BottomNavBarEvent {
  const factory BottomNavBarEvent.changePage(BottomNavEnum page) = ChangePage;
}
