import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/onboard/bloc/onboarding_bloc.dart';
import 'package:natural_groceries/core/presentation/views/onboard/bloc/onboarding_event.dart';
import 'package:natural_groceries/core/presentation/views/onboard/bloc/onboarding_state.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/base_app_bar_widget.dart';

import 'widget/onboarding_model_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with BaseStateMixin {
  final pageController = PageController(initialPage: 0, keepPage: false);
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: BlocProvider(
        create: (context) => context.read<BlocFactory>().create<OnboardingBloc>(),
        child: BlocConsumer<OnboardingBloc, OnboardingState>(
          buildWhen: (_, current) => current.buildWhen(),
          listenWhen: (_, current) => current.listenWhen(),
          listener: (context, state) => state.whenOrNull(
            success: () {
              return null;
            },
            loading: () => showLoading(),
            error: (msg, d) => showErrorDialog(msg: msg),
          ),
          builder: (context, state) => state.maybeWhen(
            orElse: () => Container(),
            pages: (indexValue, indexPage) {
              hideLoading();
              return Scaffold(
                backgroundColor: context.colors.whiteColor,
                appBar: BaseAppBarWidget(
                  title: AspectRatio(
                    aspectRatio: 208 / 55,
                    child: Image.asset(AppAssets.logoDashboardAppBarIcon,
                        height: 49.sp, width: 208.sp),
                  ),
                ),
                body: PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    indexPage = value;
                    context.read<OnboardingBloc>().add(OnboardingEvent.nexPage(value));
                  },
                  children: [
                    OnboardingModelWidget(
                      image: AppAssets.signInIcon,
                      index: indexValue,
                      header: context.strings.power_loyalty_program(AppConstants.nPower),
                      textBlack:
                          context.strings.discover_power_natural_grocers(AppConstants.nPower),
                      textRegular: context.strings.youll_earn_valuable(AppConstants.nPower),
                    ),
                    OnboardingModelWidget(
                      image: AppAssets.couponsAndSalesIcon,
                      index: indexValue,
                      header: context.strings.coupons_and_sales,
                      textBlack: context.strings.here_here_you_watch,
                      textRegular: context.strings.clip_coupons_from_your_favorite,
                    ),
                    OnboardingModelWidget(
                      image: AppAssets.whatsNewIcon,
                      index: indexValue,
                      header: context.strings.what_new,
                      textBlack: context.strings.be_in_the_know,
                      textRegular: context.strings.from_nutrition_education,
                    ),
                    OnboardingModelWidget(
                      image: AppAssets.recipesAndArticlesIcon,
                      index: indexValue,
                      header: context.strings.recipes_and_articles,
                      textBlack: context.strings.build_a_collection,
                      textRegular: context.strings.search_for_new_menu,
                    ),
                    OnboardingModelWidget(
                      image: AppAssets.storesEndEventsIcon,
                      index: indexValue,
                      header: context.strings.stores_and_events,
                      textBlack: context.strings.find_your_closest,
                      textRegular: context.strings.whether_youre_new,
                      isSkip: false,
                    ),
                  ],
                ),
                bottomNavigationBar: AspectRatio(
                  aspectRatio: 375 / 133,
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colors.greenScreenColor,
                    ),
                    child: indexValue != 4
                        ? InkWell(
                            onTap: () => AppRoutes.goTo(AppRoutes.signInRoute, hasBack: false),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  context.strings.skip,
                                  style: context.fonts.latoBold.copyWith(
                                    color: context.colors.whiteColor,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                SizedBox(width: 4.sp),
                                Padding(
                                  padding: EdgeInsets.only(right: 30.sp),
                                  child: SvgPicture.asset(AppAssets.skipIcon),
                                ),
                              ],
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => AppRoutes.goTo(AppRoutes.signInRoute),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 13.sp, horizontal: 10.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80.sp),
                                    color: context.colors.borderTrueColor,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: context.sizes.width * .60,
                                        child: Text(
                                          context.strings.get_started,
                                          style: context.fonts.latoBlack.copyWith(
                                            color: context.colors.whiteColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SvgPicture.asset(AppAssets.skipIcon),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
