import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'store_event_model.freezed.dart';
part 'store_event_model.g.dart';

@freezed
class StoreEventModel with _$StoreEventModel {
  const factory StoreEventModel({
    @JsonKey(name: 'nid') String? nid,
    @JsonKey(name: 'uid') String? uid,
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'vid') String? vid,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'langcode') String? langcode,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'created') String? created,
    @JsonKey(name: 'field_presenter_name') String? presenterName,
    @JsonKey(name: 'field_original_event_id') String? originalEventId,
    @JsonKey(name: 'field_subtitle') String? subtitle,
    @JsonKey(name: 'field_preview_thumbnail') String? previewThumbnail,
    @JsonKey(name: 'field_event_start_date') String? eventStartDate,
  }) = _StoreEventModel;

  factory StoreEventModel.fromJson(Map<String, Object?> json) => _$StoreEventModelFromJson(json);
}

extension StoreEventModelExt on StoreEventModel {
  DateTime get _startDate => DateTime.parse(eventStartDate ?? '');

  String get month => DateFormat('MMM').format(_startDate);

  String get day => DateFormat('dd').format(_startDate);

  String get weekDay => DateFormat('EEEE').format(_startDate);

  String get time => DateFormat('mm:hh aa').format(_startDate);
}
