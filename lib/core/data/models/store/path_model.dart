import 'package:freezed_annotation/freezed_annotation.dart';

part 'path_model.freezed.dart';
part 'path_model.g.dart';

@freezed
class PathModel with _$PathModel {
  const factory PathModel({
    @JsonKey(name: 'alias') String? alias,
    @JsonKey(name: 'pid') String? pid,
    @JsonKey(name: 'langcode') String? langcode,
  }) = _PathModel;

  factory PathModel.fromJson(Map<String, Object?> json) => _$PathModelFromJson(json);
}
