import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_tabs_event.freezed.dart';

@freezed
class SubTabsEvent with _$SubTabsEvent {
  const factory SubTabsEvent.toggleExpansion(int index) = ToggleExpansion;
}
