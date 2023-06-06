import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_vals_model.freezed.dart';

part 'order_vals_model.g.dart';

@freezed
class OrderValsModel with _$OrderValsModel {
  const factory OrderValsModel({
    @JsonKey(name: 'min') double? min,
    @JsonKey(name: 'max') double? max,
    @JsonKey(name: 'offerValue') double? offerValue,
    @JsonKey(name: 'maxRewardQuantity') int? maxRewardQuantity,
  }) = _OrderValsModel;

  factory OrderValsModel.fromJson(Map<String, Object?> json) => _$OrderValsModelFromJson(json);
}
