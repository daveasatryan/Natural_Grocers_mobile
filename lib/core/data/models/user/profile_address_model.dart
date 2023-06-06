import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_address_model.freezed.dart';
part 'profile_address_model.g.dart';

@freezed
class ProfileAddressModel with _$ProfileAddressModel {
  const factory ProfileAddressModel({
    @JsonKey(name: 'langcode') String? langCode,
    @JsonKey(name: 'country_code') String? countryCode,
    @JsonKey(name: 'administrative_area') String? administrativeArea,
    @JsonKey(name: 'locality') String? locality,
    @JsonKey(name: 'dependent_locality') String? dependentLocality,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'sorting_code') String? sortingCode,
    @JsonKey(name: 'address_line1') String? addressLine1,
    @JsonKey(name: 'address_line2') String? addressLine2,
    @JsonKey(name: 'organization') String? organization,
    @JsonKey(name: 'given_name') String? givenName,
    @JsonKey(name: 'additional_name') String? additionalName,
    @JsonKey(name: 'family_name') String? familyName,
  }) = _ProfileAddressModel;

  factory ProfileAddressModel.fromJson(Map<String, Object?> json) =>
      _$ProfileAddressModelFromJson(json);
}
