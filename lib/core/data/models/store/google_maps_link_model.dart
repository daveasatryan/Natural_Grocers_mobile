import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_maps_link_model.freezed.dart';
part 'google_maps_link_model.g.dart';

@freezed
class GoogleMapsLinkModel with _$GoogleMapsLinkModel {
  const factory GoogleMapsLinkModel({
    @JsonKey(name: 'uri') String? uri,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'options') List<dynamic>? options,
  }) = _GoogleMapsLinkModel;

  factory GoogleMapsLinkModel.fromJson(Map<String, Object?> json) =>
      _$GoogleMapsLinkModelFromJson(json);
}
