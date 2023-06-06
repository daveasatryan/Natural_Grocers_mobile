import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/store/body_model.dart';
import 'package:natural_groceries/core/data/models/store/path_model.dart';

part 'filters_model.freezed.dart';
part 'filters_model.g.dart';


@freezed
class FiltersModel with _$FiltersModel {
  const factory FiltersModel({
    @JsonKey(name: 'tid') String? tid,
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'revision_id') String? revisionId,
    @JsonKey(name: 'langcode') String? langcode,
    @JsonKey(name: 'vid') String? vid,
    @JsonKey(name: 'revision_created') String? revisionCreated,
    @JsonKey(name: 'revision_user') String? revisionUser,
    @JsonKey(name: 'revision_log_message') String? revisionLogMessage,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') BodyModel? description,
    @JsonKey(name: 'weight') String? weight,
    @JsonKey(name: 'parent') String? parent,
    @JsonKey(name: 'changed') String? changed,
    @JsonKey(name: 'default_langcode') String? defaultLangcode,
    @JsonKey(name: 'revision_translation_affected') String? revisionTranslationAffected,
    @JsonKey(name: 'metatag') String? metatag,
    @JsonKey(name: 'path') PathModel? path,
  }) = _FiltersModel;

  factory FiltersModel.fromJson(Map<String, Object?> json) => _$FiltersModelFromJson(json);
}