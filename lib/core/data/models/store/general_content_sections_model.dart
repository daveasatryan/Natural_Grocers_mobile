import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_content_sections_model.freezed.dart';
part 'general_content_sections_model.g.dart';

@freezed
class GeneralContentSectionsModel with _$GeneralContentSectionsModel {
  const factory GeneralContentSectionsModel({
    @JsonKey(name: 'target_id') String? targetId,
    @JsonKey(name: 'target_revision_id') String? targetRevisionId,
  }) = _GeneralContentSectionsModel;

  factory GeneralContentSectionsModel.fromJson(Map<String, Object?> json) =>
      _$GeneralContentSectionsModelFromJson(json);
}
