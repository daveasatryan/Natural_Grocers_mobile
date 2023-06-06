import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_address_model.freezed.dart';
part 'store_address_model.g.dart';

@freezed
class StoreAddressModel with _$StoreAddressModel {
  const factory StoreAddressModel({
    @JsonKey(name: 'langcode') String? langcode,
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
  }) = _StoreAddressModel;

  factory StoreAddressModel.fromJson(Map<String, Object?> json) =>
      _$StoreAddressModelFromJson(json);
}
