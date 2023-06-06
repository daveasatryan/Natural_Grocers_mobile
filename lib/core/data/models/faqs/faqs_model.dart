import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/faqs/faqs_single_model.dart';

part 'faqs_model.freezed.dart';
part 'faqs_model.g.dart';

@freezed
class FaqsModel with _$FaqsModel {
  const factory FaqsModel({
    @JsonKey(name: '{N}power Account') List<FaqsSingleModel>? npowerAccount,
    @JsonKey(name: 'Points') List<FaqsSingleModel>? points,
    @JsonKey(name: 'Rewards') List<FaqsSingleModel>? rewards,
    @JsonKey(name: 'Coupons') List<FaqsSingleModel>? coupons,
    @JsonKey(name: 'Miscellaneous') List<FaqsSingleModel>? miscellaneous,
  }) = _FaqsModel;

  factory FaqsModel.fromJson(Map<String, Object?> json) => _$FaqsModelFromJson(json);
}