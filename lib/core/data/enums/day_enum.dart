import 'package:json_annotation/json_annotation.dart';
import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';

enum DayEnum {
  @JsonValue(0)
  sunday,
  @JsonValue(1)
  monday,
  @JsonValue(2)
  tuesday,
  @JsonValue(3)
  wednesday,
  @JsonValue(4)
  thursday,
  @JsonValue(5)
  friday,
  @JsonValue(6)
  saturday;

  String get name {
    final strings = AppLocale.current;
    switch (this) {
      case DayEnum.sunday:
        return strings.title_sunday;
      case DayEnum.monday:
        return strings.title_monday;
      case DayEnum.tuesday:
        return strings.title_tuesday;
      case DayEnum.wednesday:
        return strings.title_wednesday;
      case DayEnum.thursday:
        return strings.title_thursday;
      case DayEnum.friday:
        return strings.title_friday;
      case DayEnum.saturday:
        return strings.title_saturday;
    }
  }
}
