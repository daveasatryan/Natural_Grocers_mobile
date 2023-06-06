import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/store/body_model.dart';

part 'faqs_single_model.freezed.dart';
part 'faqs_single_model.g.dart';

@unfreezed
class FaqsSingleModel with _$FaqsSingleModel {
   factory FaqsSingleModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'revision_id') String? revisionId,
    @JsonKey(name: 'langcode') String? langCode,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'created') String? created,
    @JsonKey(name: 'parent_id') String? parentId,
    @JsonKey(name: 'parent_type') String? parentType,
    @JsonKey(name: 'parent_field_name') String? parentFieldName,
    @JsonKey(name: 'behavior_settings') String? behaviorSettings,
    @JsonKey(name: 'default_langcode') String? defaultLangCode,
    @JsonKey(name: 'revision_translation_affected') String? revisionTranslationAffected,
    @JsonKey(name: 'field_answer') BodyModel? answer,
    @JsonKey(name: 'field_question') String? question,
    @Default(false) @JsonKey(includeFromJson: false) bool isExpanded,
  }) = _FaqsSingleModel;

  factory FaqsSingleModel.fromJson(Map<String, Object?> json) => _$FaqsSingleModelFromJson(json);
}