import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/models/drawer_social_media_model.dart';
import 'package:natural_groceries/core/data/models/navigation_drawer_model.dart';
import 'package:natural_groceries/core/data/utilities/helper.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/provider/user_provider.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomNavigationDrawer extends StatelessWidget with BaseStatelessMixin {
  final GlobalKey<ScaffoldState> scaffoldKey;

  CustomNavigationDrawer({
    super.key,
    required this.scaffoldKey,
  });

  final List<NavigationDrawerModel> drawerModelList = NavigationDrawerModel.getDrawerModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.sizes.width * .8,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.colors.greenScreenColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Center(child: Image.asset(AppAssets.splashIcon)),
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: drawerModelList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              NavigationDrawerModel drawerModel = drawerModelList[index];
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      scaffoldKey.currentState?.closeDrawer();
                      drawerModel.destination.let(
                        (destination) => _navigate(destination ?? ''),
                      );
                    },
                    leading: drawerModel.icon,
                    title: Text(
                      drawerModel.title ?? '',
                      style: context.fonts.latoMediumItalic
                          .copyWith(fontSize: 18.sp, color: context.colors.greyColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Divider(
                      color: context.colors.greyShade24.withOpacity(.24),
                      thickness: 1.sp,
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 30.sp),
          Row(
            children: List.generate(SocialMediaEnum.values.length, (index) {
              SocialMediaEnum socialMedia = SocialMediaEnum.values[index];
              return InkWell(
                onTap: () => launchUrl(
                  Uri.parse(socialMedia.url),
                  mode: LaunchMode.externalApplication,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: context.colors.socialMediaGreyColor),
                  ),
                  padding: EdgeInsets.all(13.sp),
                  margin: EdgeInsets.only(left: 16.sp),
                  child: socialMedia.icon,
                ),
              );
            }),
          ),
          Container(
            margin: EdgeInsets.all(30.sp),
            padding: EdgeInsets.symmetric(vertical: 14.sp),
            decoration: BoxDecoration(
              color: context.colors.enableColor,
              borderRadius: BorderRadius.circular(8.sp),
            ),
            child: InkWell(
              onTap: () {
                context.read<UserProvider>().clearUserData();
                AppRoutes.goTo(AppRoutes.signInRoute, hasBack: false);
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssets.logoutIcon),
                    SizedBox(width: 20.sp),
                    Text(
                      context.strings.logout,
                      style: context.fonts.latoMedium.copyWith(fontSize: 14.sp),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigate(String destination) {
    AppRoutes.goTo(destination);
  }
}
