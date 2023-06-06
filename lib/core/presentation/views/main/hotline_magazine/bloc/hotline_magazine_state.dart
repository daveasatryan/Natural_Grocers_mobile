import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/hotline_magazine_page_enum.dart';

part 'hotline_magazine_state.freezed.dart';

@freezed
class HotlineMagazineState with _$HotlineMagazineState {
  const factory HotlineMagazineState.initial({
    required HotlineMagazinePageEnum page,
    required int index,
  }) = _$HotlineMagazineStateInitial;
}
