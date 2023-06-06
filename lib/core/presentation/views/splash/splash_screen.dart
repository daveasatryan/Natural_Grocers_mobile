import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/data/utilities/storage/preferences_manager.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/provider/user_provider.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/views/splash/bloc/splash_bloc.dart';
import 'package:natural_groceries/core/presentation/views/splash/bloc/splash_event.dart';
import 'package:natural_groceries/core/presentation/views/splash/bloc/splash_state.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with BaseStateMixin {
  void navigateToScreens() {
    Timer(
      const Duration(seconds: 1),
      () {
        if (PreferencesManager.isFirstOne == false) {
          AppRoutes.goTo(AppRoutes.onboardingRoute, hasBack: false);
          PreferencesManager.setFirstOneValue(true);
        } else {
          if (PreferencesManager.user != null) {
            context.read<UserProvider>().userModel = PreferencesManager.user;
            AppRoutes.goTo(AppRoutes.mainRoute, hasBack: false);
          } else {
            AppRoutes.goTo(AppRoutes.signInRoute, hasBack: false);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<BlocFactory>().create<SplashBloc>()
        ..add(SplashEvent.getUser(PreferencesManager.user?.uid ?? '')),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (user) async {
              context.read<UserProvider>().userModel = user;

              await checkForPermission();
            },
            error: (msg) async => await checkForPermission(),
          );
        },
        child: Container(
          decoration: BoxDecoration(color: context.colors.greenScreenColor),
          child: Center(
            child: SizedBox(
              width: context.sizes.width * .56,
              child: Image.asset(
                AppAssets.splashIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkForPermission() async {
    await Permission.location.request();
    navigateToScreens();
  }
}
