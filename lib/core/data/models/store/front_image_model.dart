import 'package:freezed_annotation/freezed_annotation.dart';

part 'front_image_model.freezed.dart';
part 'front_image_model.g.dart';

@freezed
class FrontImageModel with _$FrontImageModel {
  const factory FrontImageModel({
    @JsonKey(name: 'target_id') String? targetId,
    @JsonKey(name: 'alt') String? alt,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'width') String? width,
    @JsonKey(name: 'height') String? height,
    @JsonKey(name: 'url') String? url,
  }) = _FrontImageModel;

  factory FrontImageModel.fromJson(Map<String, Object?> json) => _$FrontImageModelFromJson(json);
}
