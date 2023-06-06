import 'dart:math';

import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:natural_groceries/core/data/models/store/body_model.dart';
import 'package:natural_groceries/core/data/models/store/front_image_model.dart';
import 'package:natural_groceries/core/data/models/store/general_content_sections_model.dart';
import 'package:natural_groceries/core/data/models/store/geolocation_model.dart';
import 'package:natural_groceries/core/data/models/store/google_maps_link_model.dart';
import 'package:natural_groceries/core/data/models/store/path_model.dart';
import 'package:natural_groceries/core/data/models/store/seo_model.dart';
import 'package:natural_groceries/core/data/models/store/store_address_model.dart';
import 'package:natural_groceries/core/data/models/store/store_hours_model.dart';
import 'package:vector_math/vector_math.dart';

part 'store_model.freezed.dart';

part 'store_model.g.dart';

@freezed
class StoreModel with _$StoreModel {
  factory StoreModel({
    @JsonKey(name: 'nid') String? nid,
    @JsonKey(name: 'uid') String? uid,
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'vid') String? vid,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'langcode') String? langcode,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'revision_timestamp') String? revisionTimestamp,
    @JsonKey(name: 'revision_uid') String? revisionUid,
    @JsonKey(name: 'revision_log') String? revisionLog,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'created') String? created,
    @JsonKey(name: 'changed') String? changed,
    @JsonKey(name: 'promote') String? promote,
    @JsonKey(name: 'sticky') String? sticky,
    @JsonKey(name: 'default_langcode') String? defaultLangcode,
    @JsonKey(name: 'revision_translation_affected') String? revisionTranslationAffected,
    @JsonKey(name: 'moderation_state') String? moderationState,
    @JsonKey(name: 'scheduled_transition_date') String? scheduledTransitionDate,
    @JsonKey(name: 'scheduled_transition_state') String? scheduledTransitionState,
    @JsonKey(name: 'scheduled_publication') String? scheduledPublication,
    @JsonKey(name: 'scheduled_moderation_state') String? scheduledModerationState,
    @JsonKey(name: 'metatag') String? metatag,
    @JsonKey(name: 'path') PathModel? path,
    @JsonKey(name: 'publish_on') String? publishOn,
    @JsonKey(name: 'unpublish_on') String? unpublishOn,
    @JsonKey(name: 'body') BodyModel? body,
    @JsonKey(name: 'field_available_features')
        List<GeneralContentSectionsModel>? fieldAvailableFeatures,
    @JsonKey(name: 'field_exclude_index') String? fieldExcludeIndex,
    @JsonKey(name: 'field_facebook_page') GoogleMapsLinkModel? fieldFacebookPage,
    @JsonKey(name: 'field_g4u_crew') String? fieldG4uCrew,
    // @JsonKey(name: 'field_general_content_sections')
    //     GeneralContentSectionsModel? fieldGeneralContentSections, //! lista u model
    // @JsonKey(name: 'field_good4u_crew_members')
    //     List<GeneralContentSectionsModel>? fieldGood4uCrewMembers, //! mi angam lista mi angam model.
    @JsonKey(name: 'field_google_maps_link') GoogleMapsLinkModel? fieldGoogleMapsLink,
    @JsonKey(name: 'field_has_nhc') String? fieldHasNhc,
    @JsonKey(name: 'field_instacart_availability') String? fieldInstacartAvailability,
    @JsonKey(name: 'field_meeting_space_available') String? fieldMeetingSpaceAvailable,
    @JsonKey(name: 'field_meta_tags') String? fieldMetaTags,
    @JsonKey(name: 'field_nhc_form_url') GoogleMapsLinkModel? fieldNhcFormUrl,
    @JsonKey(name: 'field_nhc_scheduling_url') GoogleMapsLinkModel? fieldNhcSchedulingUrl,
    @JsonKey(name: 'field_npower_store_id') String? fieldNpowerStoreId,
    @JsonKey(name: 'field_open') String? fieldOpen,
    @JsonKey(name: 'field_opening_date') String? fieldOpeningDate,
    @JsonKey(name: 'field_opening_date_text') String? fieldOpeningDateText,
    @JsonKey(name: 'field_review_us_link') GoogleMapsLinkModel? fieldReviewUsLink,
    @JsonKey(name: 'field_sap_id') String? fieldSapId,
    @JsonKey(name: 'field_sapfield_sidebar_content_sections_id')
        String? fieldSidebarContentSections,
    @JsonKey(name: 'field_store_address') StoreAddressModel? fieldStoreAddress,
    @JsonKey(name: 'field_store_front_image') FrontImageModel? fieldStoreFrontImage,
    @JsonKey(name: 'field_store_geolocation') GeolocationModel? fieldStoreGeolocation,
    @JsonKey(name: 'field_store_hours') List<StoreHoursModel>? fieldStoreHours,
    @JsonKey(name: 'field_store_id') String? fieldStoreId,
    // @JsonKey(name: 'field_store_slide_show') FrontImageModel? fieldStoreSlideShow, //! list model
    @JsonKey(name: 'field_store_telephone_number') String? number,
    @JsonKey(name: 'field_yoast_seo') SeoModel? fieldYoastSeo,
  }) = _StoreModel;

  factory StoreModel.fromJson(Map<String, Object?> json) => _$StoreModelFromJson(json);
}

extension StoreModelExt on StoreModel {
  DateTime get date => DateTime.now();

  String get month => DateFormat('MMM').format(date);

  String get day => DateFormat('dd').format(date);

  String get weekDay => DateFormat('EEEE').format(date);

  String get time => DateFormat('mm:hh aa').format(date);

  String? get address => fieldStoreAddress == null
      ? null
      : '${fieldStoreAddress?.addressLine1}\n${fieldStoreAddress?.locality}, ${fieldStoreAddress?.administrativeArea} ${fieldStoreAddress?.postalCode}';

  int? getMiles(double myLat, double myLng) {
    final lat = fieldStoreGeolocation?.lat.toDouble();
    final lng = fieldStoreGeolocation?.lng.toDouble();
    if (lat == null || lng == null) return null;
    return (6371 *
            acos(cos(radians(lat)) * cos(radians(myLat)) * cos(radians(myLng) - radians(lng)) +
                sin(radians(lat)) * sin(radians(myLat)))) ~/
        1.60934;
  }

  String? get fullTitle => '${fieldStoreAddress?.administrativeArea} - $title';
}
