import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/dashboard_screen.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/bottom_nav_bar/bloc/bottom_nav_bar_bloc.dart';
import 'package:natural_groceries/core/presentation/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/base_app_bar_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/navigation_drawer/navigation_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: BlocProvider(
        create: (context) => context.read<BlocFactory>().create<BottomNavBarBloc>(),
        child: Scaffold(
          backgroundColor: context.colors.whiteColor,
          key: _key,
          appBar: BaseAppBarWidget(
            title: Image.asset(AppAssets.logoDashboardAppBarIcon, height: 49.sp, width: 208.sp),
            leading: Padding(
              padding: EdgeInsets.only(left: 15.sp),
              child: InkWell(
                onTap: () => _key.currentState?.openDrawer(),
                child: SvgPicture.asset(AppAssets.menuIcon),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  AppRoutes.goToNested(AppRoutes.profileRoute);
                },
                child: SvgPicture.asset(AppAssets.profileAppBarIcon),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.sp, right: 15.sp),
                child: SvgPicture.asset(AppAssets.downAppBarIcon),
              ),
            ],
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Navigator(
                  key: Get.nestedKey(AppRoutes.mainNavigationKey),
                  initialRoute: AppRoutes.dashboardRoute,
                  onGenerateRoute: (settings) {
                    return GetPageRoute(
                      page: () =>
                          AppRoutes.mainRoutes
                              .firstWhereOrNull((route) => route.name == settings.name)
                              ?.page() ??
                          const DashboardScreen(),
                      settings: settings,
                    );
                  },
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomNavBar(),
                ),
              ],
            ),
          ),
          drawer: CustomNavigationDrawer(scaffoldKey: _key),
        ),
      ),
    );
  }
}
