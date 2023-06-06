import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/store/path_model.dart';
import 'package:natural_groceries/core/data/models/user/profile_address_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'uid') String? uid,
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'langcode') String? langCode,
    @JsonKey(name: 'preferred_langcode') String? preferredLangCode,
    @JsonKey(name: 'preferred_admin_langcode') String? preferredAdminLangCode,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'mail') String? email,
    @JsonKey(name: 'timezone') String? timezone,
    // @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'created') String? created,
    @JsonKey(name: 'changed') String? changed,
    @JsonKey(name: 'access') String? access,
    @JsonKey(name: 'login') String? login,
    @JsonKey(name: 'init') String? init,
    @JsonKey(name: 'roles') List? roles,
    @JsonKey(name: 'default_langcode') String? defaultLangCode,
    @JsonKey(name: 'api_key') String? apiKey,
    @JsonKey(name: 'metatag') String? metaTag,
    @JsonKey(name: 'path') PathModel? path,
    @JsonKey(name: 'field_bike_code') String? bikeCode,
    @JsonKey(name: 'field_birth_date') String? birthDate,
    @JsonKey(name: 'field_cashier_id') String? cashierId,
    @JsonKey(name: 'field_challenge_source') String? challengeSource,
    @JsonKey(name: 'field_dietary_preferences') String? dietaryPreferences,
    @JsonKey(name: 'field_dietary_prefrences') String? dietaryPrefrences,
    @JsonKey(name: 'field_digital_hotline_subscribed') String? digitalHotlineSubscribed,
    @JsonKey(name: 'field_employee_code') String? employeeCode,
    @JsonKey(name: 'field_favorite_recipes') List? favoriteRecipes,
    @JsonKey(name: 'field_first_name') String? firstName,
    @JsonKey(name: 'field_g4u_crew_title') String? g4uCrewTitle,
    @JsonKey(name: 'field_g4u_hhl_registeration') String? g4uHhlRegistration,
    @JsonKey(name: 'field_good_4_you_challenge') String? good4YouChallenge,
    @JsonKey(name: 'field_hhl_magazine_subscribed') String? hhlMagazineSubscribed,
    @JsonKey(name: 'field_indicator') String? indicator,
    @JsonKey(name: 'field_last_name') String? lastName,
    @JsonKey(name: 'field_mobile_app_first_login') String? mobileAppFirstLogin,
    @JsonKey(name: 'field_mobile_app_last_login') String? mobileAppLastLogin,
    @JsonKey(name: 'field_ng_events_subscribed') String? ngEventsSubscribed,
    @JsonKey(name: 'field_pos_id') String? posId,
    @JsonKey(name: 'field_profile_address') ProfileAddressModel? profileAddress,
    @JsonKey(name: 'field_profile_gender') String? profileGender,
    @JsonKey(name: 'field_profile_picture') String? profilePicture,
    @JsonKey(name: 'field_preferred_store') String? preferredStore,
    @JsonKey(name: 'field_referer') String? referer,
    @JsonKey(name: 'field_register_source') String? registerSource,
    @JsonKey(name: 'field_ri_card_number') String? riCardNumber,
    @JsonKey(name: 'field_ri_subscribed') String? riSubscribed,
    @JsonKey(name: 'field_ri_shopper_id') String? riShopperId,
    @JsonKey(name: 'field_ri_shopper_token') String? riShopperToken,
    @JsonKey(name: 'field_subscription_delicious_rec') String? subscriptionDeliciousRec,
    @JsonKey(name: 'field_subscription_initial_set') String? subscriptionInitialSet,
    @JsonKey(name: 'field_subscription_educational_r') String? subscriptionEducationalR,
    @JsonKey(name: 'field_subscription_exclusive_dig') String? subscriptionExclusiveDig,
    @JsonKey(name: 'field_subscription_loyalty_point') String? subscriptionLoyaltyPoint,
    @JsonKey(name: 'field_subscription_preferred_sto') String? subscriptionPreferredSto,
    @JsonKey(name: 'field_subscription_surveys_we_lo') String? subscriptionSurveysWeLo,
    @JsonKey(name: 'field_user_phone_number') String? userPhoneNumber,
    @JsonKey(name: 'token') String? token,
    @JsonKey(name: 'field_vip_code') String? vipCode,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}
