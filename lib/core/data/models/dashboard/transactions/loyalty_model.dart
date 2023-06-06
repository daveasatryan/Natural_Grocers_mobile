import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_model.freezed.dart';
part 'loyalty_model.g.dart';

@freezed
class LoyaltyModel with _$LoyaltyModel {
  const factory LoyaltyModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'qualifierId') int? qualifierId,
    @JsonKey(name: 'qualifierShortDescription') String? qualifierShortDescription,
    @JsonKey(name: 'pointsEarned') int? pointsEarned,
    @JsonKey(name: 'redeemStatus') String? redeemStatus,
  }) = _LoyaltyModel;

  factory LoyaltyModel.fromJson(Map<String, Object?> json) => _$LoyaltyModelFromJson(json);
}
