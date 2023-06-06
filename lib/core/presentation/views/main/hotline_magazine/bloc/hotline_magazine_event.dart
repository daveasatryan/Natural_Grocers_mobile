import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/hotline_magazine_page_enum.dart';

part 'hotline_magazine_event.freezed.dart';

@freezed
class HotlineMagazineEvent with _$HotlineMagazineEvent {
  const factory HotlineMagazineEvent.changePage({
    required HotlineMagazinePageEnum page,
    int? index,
  }) = ChangePage;

  const factory HotlineMagazineEvent.changePhoto({
    required int index,
  }) = ChangePhoto;
}
