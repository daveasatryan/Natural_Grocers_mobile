import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_tabs_state.freezed.dart';

@Freezed(equal: false)
class SubTabsState with _$SubTabsState {
  const factory SubTabsState.initial({int? expandedIndex}) = _$SubTabsStateInitial;
}
