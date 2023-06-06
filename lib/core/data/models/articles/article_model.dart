import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/store/body_model.dart';
import 'package:natural_groceries/core/data/models/store/general_content_sections_model.dart';
import 'package:natural_groceries/core/data/models/store/path_model.dart';
import 'package:natural_groceries/core/data/models/store/seo_model.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

@freezed
class ArticleModel with _$ArticleModel {
  const factory ArticleModel({
    @JsonKey(name: 'nid') String? nid,
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'vid') String? vid,
    @JsonKey(name: 'langcode') String? langCode,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'revision_timestamp') String? revisionTimestamp,
    @JsonKey(name: 'revision_uid') String? revisionUid,
    @JsonKey(name: 'revision_log') String? revisionLog,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'uid') String? uid,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'created') String? created,
    @JsonKey(name: 'changed') String? changed,
    @JsonKey(name: 'promote') String? promote,
    @JsonKey(name: 'sticky') String? sticky,
    @JsonKey(name: 'default_langcode') String? defaultLangCode,
    @JsonKey(name: 'revision_translation_affected') String? revisionTranslationAffected,
    @JsonKey(name: 'moderation_state') String? moderationState,
    @JsonKey(name: 'scheduled_transition_date') String? scheduledTransitionDate,
    @JsonKey(name: 'scheduled_transition_state') String? scheduledTransitionState,
    @JsonKey(name: 'scheduled_publication') String? scheduledPublication,
    @JsonKey(name: 'scheduled_moderation_state') String? scheduledModerationState,
    @JsonKey(name: 'metatag') String? metaTag,
    @JsonKey(name: 'path') PathModel? path,
    @JsonKey(name: 'publish_on') String? publishOn,
    @JsonKey(name: 'unpublish_on') String? unpublishOn,
    @JsonKey(name: 'body') BodyModel? body,
    /*@JsonKey(name: 'field_article_category') String? fieldArticleCategory,*/ //todo: convert error
    @JsonKey(name: 'field_article_type') String? fieldArticleType,
    /*@JsonKey(name: 'field_author') String? fieldAuthor,*/ //todo: convert error
    /*@JsonKey(name: 'field_demographics') String? fieldDemographics,*/ //todo: convert model
    /*@JsonKey(name: 'field_dietary_supplements') List<GeneralContentSectionsModel>? fieldDietarySupplements,*/ //todo: convert error
    @JsonKey(name: 'field_exclude_index') String? fieldExcludeIndex,
    /*@JsonKey(name: 'field_food_topics') String? fieldFoodTopics,*/ //todo: convert error
    /*@JsonKey(name: 'field_general_content_sections') GeneralContentSectionsModel? fieldGeneralContentSections,*/ //todo: convert error
    /*@JsonKey(name: 'field_health_protocol') List<GeneralContentSectionsModel>? fieldHealthProtocol,*/ //todo: convert error
    /*@JsonKey(name: 'field_health_topics') List<GeneralContentSectionsModel>? fieldHealthTopics,*/ //todo: convert error
    /*@JsonKey(name: 'field_hidden_topic') String? fieldHiddenTopic,*/ //todo: convert error
    @JsonKey(name: 'field_meta_tags') String? fieldMetaTags,
    @JsonKey(name: 'field_preview_thumbnail') String? fieldPreviewThumbnail,
    /*@JsonKey(name: 'field_refrences') String? fieldReferences,*/ //todo: convert error
    @JsonKey(name: 'field_sidebar_content_sections') String? fieldSidebarContentSections,
    /*@JsonKey(name: 'field_sustainable_food') String? fieldSustainableFood,*/ //todo: convert error
    @JsonKey(name: 'field_tags') List<GeneralContentSectionsModel>? fieldTags,
    @JsonKey(name: 'field_yoast_seo') SeoModel? fieldYoastSeo,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, Object?> json) => _$ArticleModelFromJson(json);
}
