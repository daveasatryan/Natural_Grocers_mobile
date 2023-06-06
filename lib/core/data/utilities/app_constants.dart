import 'package:dart_date/dart_date.dart';

class AppConstants {
  Map<int, List<int>> get nextWeek {
    final Map<int, List<int>> map = {};

    DateTime day = DateTime.now();

    for (int i = 0; i < 6; i++) {
      day = day.nextDay;
      map[day.getDay] = [day.getMilliseconds];
    }
    return map;
  }

  static const String nPower = '{N}';

  static const String mockPicture =
      'https://st2.depositphotos.com/1194063/7135/i/950/depositphotos_71351499-stock-photo-grill.jpg';

  static const termsAndConditionsUrl = 'https://www.naturalgrocers.com/npower-terms-use';
  static const healthHotlineMagazineUrl = 'https://www.naturalgrocers.com/subscribe';

  static const instagramUrl = 'https://www.instagram.com/naturalgrocers';
  static const facebookUrl = 'https://www.facebook.com/NaturalGrocers';
  static const tiktokUrl = 'https://www.tiktok.com/@shopnaturalgrocers';
  static const twitterUrl = 'https://twitter.com/naturalgrocers';
  static const youtubeUrl = 'https://www.youtube.com/channel/UCdBPUfDtnD6qDMramNjM1Rg';

  static const lat = 32.410136;
  static const lng = -99.772856;
  static const latSin = 0.53597615375339;
  static const latCos = 0.84423312100848;
  static const lngRad = -1.7413648413182;
}
