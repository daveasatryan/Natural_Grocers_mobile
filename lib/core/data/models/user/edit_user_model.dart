import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_user_model.freezed.dart';
part 'edit_user_model.g.dart';

@freezed
class EditUserModel with _$EditUserModel {
  const factory EditUserModel({
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'mail') String? email,
    @JsonKey(name: 'pass') String? password,
    @JsonKey(name: 'field_user_phone_number') String? userPhoneNumber,
    @JsonKey(name: 'field_preferred_store') String? preferredStore,
  }) = _EditUserModel;

  factory EditUserModel.fromJson(Map<String, Object?> json) => _$EditUserModelFromJson(json);
}