import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/bottom_nav_enum.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/data/utilities/storage/preferences_manager.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/provider/user_provider.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/bloc/profile_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/bloc/profile_event.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/bloc/profile_state.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/widgets/health_hotline_magazine.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/widgets/my_favorite_articles.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/widgets/my_favorite_recipes.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/widgets/my_personal_information.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/widgets/my_preferred_store/my_preferred_store.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/widgets/title_header_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/bottom_nav_bar/bloc/bottom_nav_bar_bloc.dart';
import 'package:natural_groceries/core/presentation/widgets/bottom_nav_bar/bloc/bottom_nav_bar_event.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.whiteColor,
      body: BlocProvider(
        create: (context) => context.read<BlocFactory>().create<ProfileBloc>()
          ..add(ProfileEvent.getUserInfo(uid: PreferencesManager.user?.uid ?? '')),
        child: BlocConsumer<ProfileBloc, ProfileState>(
          buildWhen: (prev, cur) => cur.buildWhen(),
          listenWhen: (prev, cur) => cur.listenWhen(),
          listener: (context, state) {
            state.whenOrNull(
              getUserSuccess: (user) => context.read<UserProvider>().userModel = user,
              error: (msg) => showErrorDialog(msg: msg),
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => Container(),
              initial: (viewType, favorites) {
                return Consumer<UserProvider>(
                  builder: (context, userProvider, child) {
                    final userModel = userProvider.userModel;
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 100.sp),
                        child: Column(
                          children: [
                            HeaderWidget(
                              height: 100.sp,
                              text: strings.my_profile,
                              textStyle: fonts.latoBlackItalic.copyWith(
                                fontSize: 26.sp,
                                color: colors.whiteYellowColor,
                              ),
                              isNested: true,
                            ),
                            SizedBox(height: 5.sp),
                            Container(
                              width: sizes.width,
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: colors.whiteColor,
                              ),
                              child: Column(
                                children: [
                                  TitleHeaderProfileWidget(
                                    title: strings.my_personal_information,
                                    showIcon: true,
                                    onTap: () => AppRoutes.goTo(
                                      AppRoutes.editProfileRoute,
                                    ),
                                  ),
                                  MyPersonalInformation(userModel: userModel),
                                  SizedBox(height: 15.sp),
                                  TitleHeaderProfileWidget(
                                    title: strings.my_preferred_store,
                                    showIcon: true,
                                    iconColor: colors.whisperOpacityColor,
                                    onTap: () {
                                      context.read<BottomNavBarBloc>().add(
                                          const BottomNavBarEvent.changePage(BottomNavEnum.stores));
                                      AppRoutes.goToNested(
                                        AppRoutes.storesRoute,
                                        hasBack: false,
                                      );
                                    },
                                  ),
                                  MyPreferredStore(preferredStore: userModel?.preferredStore),
                                  SizedBox(height: 30.sp),
                                  TitleHeaderProfileWidget(
                                    title: strings.my_favorite_recipes,
                                    showSeeAllButton: favorites.isNotNullOrEmpty(),
                                    onTap: () {
                                      context.read<BottomNavBarBloc>().add(
                                          const BottomNavBarEvent.changePage(BottomNavEnum.stores));
                                      AppRoutes.goToNested(
                                        AppRoutes.recipesRoute,
                                        hasBack: false,
                                      );
                                    },
                                  ),
                                  MyFavoriteRecipes(
                                    viewType: viewType,
                                    favorites: favorites,
                                  ),
                                  SizedBox(height: 30.sp),
                                  TitleHeaderProfileWidget(
                                    title: strings.my_favorite_articles,
                                  ),
                                  MyFavoriteArticles(
                                    viewType: viewType,
                                    favorites: favorites,
                                  ),
                                  SizedBox(height: 30.sp),
                                  TitleHeaderProfileWidget(
                                    title: strings.health_hotline_magazine,
                                  ),
                                  SizedBox(height: 10.sp),
                                  const HealthHotlineMagazineWidget()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
