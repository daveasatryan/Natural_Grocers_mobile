import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/day_enum.dart';
import 'package:natural_groceries/core/data/utilities/date_utilities.dart';

part 'store_hours_model.freezed.dart';
part 'store_hours_model.g.dart';

@freezed
class StoreHoursModel with _$StoreHoursModel {
  const factory StoreHoursModel({
    @Default(null) @JsonKey(name: 'day', unknownEnumValue: null) DayEnum? day,
    @JsonKey(name: 'starthours') int? starthours,
    @JsonKey(name: 'endhours') int? endhours,
    @JsonKey(name: 'comment') String? comment,
  }) = _StoreHoursModel;

  factory StoreHoursModel.fromJson(Map<String, Object?> json) => _$StoreHoursModelFromJson(json);
}

extension StoreHoursModelExt on StoreHoursModel {
  String? get times =>
      '${DateUtilities.convertMilitaryToRegularTime(starthours ?? 0)} - ${DateUtilities.convertMilitaryToRegularTime(endhours ?? 0)}';
}
