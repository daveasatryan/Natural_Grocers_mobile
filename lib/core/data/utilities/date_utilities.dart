import 'package:intl/intl.dart';

class DateUtilities {
  static DateTime get date => DateTime.now();

  static String get month => printDateWith(date);

  static get printDateLine => printDateWithLine(date);

  static get pickDateDay => printStartEndDates(date);

  String get time => DateFormat('mm:hh aa').format(date);

  static String printDateWith(DateTime date, {String pattern = 'MM/dd/yyyy'}) =>
      DateFormat(pattern).format(date);

  static String printDateWithLine(DateTime date, {String pattern = 'MM-dd-yyyy'}) =>
      DateFormat(pattern).format(date);

  static String printStartEndDates(DateTime date, {String pattern = 'EEE, MMM d'}) =>
      DateFormat(pattern).format(date);

  static String convertMilitaryToRegularTime(int militaryTime) {
    int hour = militaryTime ~/ 100;
    int minute = militaryTime % 100;

    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
      return 'Invalid military time';
    }

    String period = (hour < 12) ? 'AM' : 'PM';
    hour = (hour > 12) ? hour - 12 : hour;
    return '${hour.toString()}:${minute.toString().padLeft(2, '0')} $period';
  }
}
