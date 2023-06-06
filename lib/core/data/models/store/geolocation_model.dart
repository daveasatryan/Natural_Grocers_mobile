import 'package:freezed_annotation/freezed_annotation.dart';

part 'geolocation_model.freezed.dart';
part 'geolocation_model.g.dart';

@freezed
class GeolocationModel with _$GeolocationModel {
  const factory GeolocationModel({
    @JsonKey(name: 'lat') String? lat,
    @JsonKey(name: 'lng') String? lng,
    @JsonKey(name: 'lat_sin') String? latSin,
    @JsonKey(name: 'lat_cos') String? latCos,
    @JsonKey(name: 'lng_rad') String? lngRad,
    @JsonKey(name: 'data') String? data,
  }) = _GeolocationModel;

  factory GeolocationModel.fromJson(Map<String, Object?> json) => _$GeolocationModelFromJson(json);
}
