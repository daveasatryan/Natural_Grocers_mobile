import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/store/body_model.dart';
import 'package:natural_groceries/core/data/models/store/path_model.dart';
import 'package:natural_groceries/core/data/models/store/seo_model.dart';

part 'recipes_model.freezed.dart';
part 'recipes_model.g.dart';

@freezed
class RecipesModel with _$RecipesModel {
  const factory RecipesModel({
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
    @JsonKey(name: 'field_beverage_pairing') BodyModel? fieldBeveragePairing,
    @JsonKey(name: 'field_exclude_index') String? fieldExcludeIndex,
    @JsonKey(name: 'field_health_hotline_recipe') String? fieldHealthHotlineRecipe,
    /*@JsonKey(name: 'field_ingredients') List<GeneralContentSectionsModel>? fieldIngredients,*/ //todo: change
    @JsonKey(name: 'field_instructions') BodyModel? fieldInstructions,
    @JsonKey(name: 'field_meta_tags') String? fieldMetaTags,
    @JsonKey(name: 'field_nutrition_info') BodyModel? fieldNutritionInfo,
    /*@JsonKey(name: 'field_recipe_attributes') String? fieldRecipeAttributes,*/ //todo: change
    /*@JsonKey(name: 'field_recipe_course') String? fieldRecipeCourse,*/ //todo: change
    /*@JsonKey(name: 'field_recipe_dish_type') String? fieldRecipeDishType,*/ //todo: change
    /*@JsonKey(name: 'field_recipe_image') FrontImageModel? fieldRecipeImage,*/ //todo: change
    @JsonKey(name: 'field_recipe_keywords') String? fieldRecipeKeywords,
    @JsonKey(name: 'field_recipe_list') String? fieldRecipeList,
    /*@JsonKey(name: 'field_recipe_special_diet') List<GeneralContentSectionsModel>? fieldRecipeSpecialDiet,*/ // todo: change
    @JsonKey(name: 'field_recipe_time') String? fieldRecipeTime,
    @JsonKey(name: 'field_recipe_time_minutes') String? fieldRecipeTimeMinutes,
    @JsonKey(name: 'field_recipe_type') String? fieldRecipeType,
    @JsonKey(name: 'field_recipe_video') String? fieldRecipeVideo,
    @JsonKey(name: 'field_serve_size_text') String? fieldServeSizeText,
    @JsonKey(name: 'field_serving_size') String? fieldServingSize,
    /*@JsonKey(name: 'field_sidebar_content_sections') String? fieldSidebarContentSections,*/ //todo: change
    @JsonKey(name: 'field_staff_pick') String? fieldStaffPick,
    @JsonKey(name: 'field_yoast_seo') SeoModel? fieldYoastSeo,
  }) = _RecipesModel;

  factory RecipesModel.fromJson(Map<String, Object?> json) => _$RecipesModelFromJson(json);
}
