import 'package:freezed_annotation/freezed_annotation.dart';

part 'more_ways_to_save_event.freezed.dart';

@freezed
class MoreWaysToSaveEvent with _$MoreWaysToSaveEvent {
  const factory MoreWaysToSaveEvent.getMoreWaysToSave() = GetMoreWaysToSave;
}
