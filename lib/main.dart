import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:natural_groceries/core/data/utilities/injection/injection.dart';
import 'package:natural_groceries/core/data/utilities/log/logger_service.dart';
import 'package:natural_groceries/core/data/utilities/storage/preferences_manager.dart';
import 'package:natural_groceries/core/presentation/application.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      //await Firebase.initializeApp();
      // FlutterError.onError = (errorDetails) {
      //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // };
      // // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
      // PlatformDispatcher.instance.onError = (error, stack) {
      //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      //   return true;
      // };

      // final GoogleMapsFlutterPlatform mapsImplementation = GoogleMapsFlutterPlatform.instance;
      // if (mapsImplementation is GoogleMapsFlutterAndroid) {
      //   mapsImplementation.useAndroidViewSurface = true;
      // }
      await configureDependencies();
      await PreferencesManager.initPreferences();
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [
          SystemUiOverlay.bottom,
          SystemUiOverlay.top,
        ],
      );
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      runApp(const Application());
    },
    (error, stackTrace) {
      LoggerService().e(
        'Error is $error, stack $stackTrace',
      );
    },
  );
}
