import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_model.freezed.dart';
part 'sign_up_model.g.dart';

@freezed
class SignUpModel with _$SignUpModel {
  const factory SignUpModel({
    @JsonKey(name: 'mail') String? email,
    @JsonKey(name: 'pass') String? password,
    @JsonKey(name: 'pass_confirm') String? passwordConfirm,
    @JsonKey(name: 'field_user_phone_number') String? userPhoneNumber,
    @JsonKey(name: 'field_preferred_store') String? preferredStore,
  }) = _SignUpModel;

  factory SignUpModel.fromJson(Map<String, Object?> json) => _$SignUpModelFromJson(json);
}
