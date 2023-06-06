import 'package:freezed_annotation/freezed_annotation.dart';

part 'seo_model.freezed.dart';
part 'seo_model.g.dart';

@freezed
class SeoModel with _$SeoModel {
  const factory SeoModel({
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'focus_keyword') String? focusKeyword,
  }) = _SeoModel;

  factory SeoModel.fromJson(Map<String, Object?> json) => _$SeoModelFromJson(json);
}
