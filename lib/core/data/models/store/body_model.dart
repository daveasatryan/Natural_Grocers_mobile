import 'package:freezed_annotation/freezed_annotation.dart';

part 'body_model.freezed.dart';
part 'body_model.g.dart';

@freezed
class BodyModel with _$BodyModel {
  const factory BodyModel({
    @JsonKey(name: 'value') String? value,
    @JsonKey(name: 'summary') String? summary,
    @JsonKey(name: 'format') String? format,
  }) = _BodyModel;

  factory BodyModel.fromJson(Map<String, Object?> json) => _$BodyModelFromJson(json);
}
