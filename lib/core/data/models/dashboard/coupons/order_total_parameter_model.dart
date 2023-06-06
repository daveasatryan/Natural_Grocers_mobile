import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/dashboard/coupons/department_model.dart';
import 'package:natural_groceries/core/data/models/dashboard/coupons/order_vals_model.dart';
import 'package:natural_groceries/core/data/models/dashboard/coupons/upc_groups_model.dart';

part 'order_total_parameter_model.freezed.dart';

part 'order_total_parameter_model.g.dart';

@freezed
class OrderTotalParameterModel with _$OrderTotalParameterModel {
  const factory OrderTotalParameterModel({
    @JsonKey(name: 'includeUPCs') UpcGroupsModel? includeUPCs,
    @JsonKey(name: 'excludeUPCs') UpcGroupsModel? excludeUPCs,
    @JsonKey(name: 'includeDepartments') DepartmentModel? includeDepartments,
    @JsonKey(name: 'excludeDepartments') DepartmentModel? excludeDepartments,
    @JsonKey(name: 'rewardUPCs') String? rewardUPCs,
    @JsonKey(name: 'orderVals') OrderValsModel? orderVals,
  }) = _OrderTotalParameterModel;

  factory OrderTotalParameterModel.fromJson(Map<String, Object?> json) =>
      _$OrderTotalParameterModelFromJson(json);
}
