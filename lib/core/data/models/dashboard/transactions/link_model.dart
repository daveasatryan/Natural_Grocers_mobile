import 'package:freezed_annotation/freezed_annotation.dart';

part 'link_model.freezed.dart';
part 'link_model.g.dart';

@freezed
class LinkModel with _$LinkModel {
  const factory LinkModel({
    @JsonKey(name: 'self') String? self,
    @JsonKey(name: 'next') String? next,
  }) = _LinkModel;

  factory LinkModel.fromJson(Map<String, Object?> json) => _$LinkModelFromJson(json);
}
