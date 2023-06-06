import 'package:freezed_annotation/freezed_annotation.dart';

part 'more_ways_to_save_model.freezed.dart';
part 'more_ways_to_save_model.g.dart';

@freezed
class MoreWaysToSaveModel with _$MoreWaysToSaveModel {
  const factory MoreWaysToSaveModel({
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'click_url') String? clickUrl,
  }) = _MoreWaysToSaveModel;

  factory MoreWaysToSaveModel.fromJson(Map<String, Object?> json) => _$MoreWaysToSaveModelFromJson(json);
}