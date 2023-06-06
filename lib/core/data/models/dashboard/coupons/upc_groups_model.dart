import 'package:freezed_annotation/freezed_annotation.dart';

part 'upc_groups_model.freezed.dart';

part 'upc_groups_model.g.dart';

@freezed
class UpcGroupsModel with _$UpcGroupsModel {
  const factory UpcGroupsModel({
    @JsonKey(name: 'upc') List<int>? upc,
  }) = _UpcGroupsModel;

factory UpcGroupsModel.fromJson(Map<String, Object?> json) => _$UpcGroupsModelFromJson(json);
}
