import 'package:get/get.dart';
import 'package:natural_groceries/core/presentation/views/article_filters/article_filters.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password/forget_password.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password_enter_email/forget_password_enter_email.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password_time_invalid_email/forget_password_time_invalid_email.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password_time_valid_email/forget_password_time_valid_email.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_in/sign_in_screen.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_up/sign_up_screen.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_up_store_screen/sign_up_stores.dart';
import 'package:natural_groceries/core/presentation/views/communication_preferences/communication_preferences.dart';
import 'package:natural_groceries/core/presentation/views/contact_us/contact_us.dart';
import 'package:natural_groceries/core/presentation/views/edit_profile/edit_profile.dart';
import 'package:natural_groceries/core/presentation/views/main/article_details/article_details.dart';
import 'package:natural_groceries/core/presentation/views/main/available_coupons/available_coupons_screen.dart';
import 'package:natural_groceries/core/presentation/views/main/bingo_options/bingo_options.dart';
import 'package:natural_groceries/core/presentation/views/main/clipped_coupons/clipped_coupons_screen.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/dashboard_screen.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/hotline_magazine.dart';
import 'package:natural_groceries/core/presentation/views/main/latest_transactions/latest_transactions_screen.dart';
import 'package:natural_groceries/core/presentation/views/main/main_screen.dart';
import 'package:natural_groceries/core/presentation/views/main/meal_deals/meal_deals.dart';
import 'package:natural_groceries/core/presentation/views/main/more_ways_to_save/more_ways_to_save.dart';
import 'package:natural_groceries/core/presentation/views/main/news/news_screen.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/profile_screen.dart';
import 'package:natural_groceries/core/presentation/views/main/recipe_details/recipe_details.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/recipes_and_articles_screen.dart';
import 'package:natural_groceries/core/presentation/views/main/store_details/store_details_screen.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/stores_screen.dart';
import 'package:natural_groceries/core/presentation/views/main/transaction_details/transaction_details_screen.dart';
import 'package:natural_groceries/core/presentation/views/n_power_faqs/n_power_faqs.dart';
import 'package:natural_groceries/core/presentation/views/onboard/onboarding_screen.dart';
import 'package:natural_groceries/core/presentation/views/recipe_filters/recipe_filters.dart';
import 'package:natural_groceries/core/presentation/views/splash/splash_screen.dart';

class AppRoutes {
  // root navigation routes
  static const splashRoute = '/';
  static const onboardingRoute = '/onboardingScreen';
  static const signInRoute = '/sign-in-screen';
  static const signUpRoute = '/sign-up-screen';
  static const forgetPasswordRoute = '/forgot-password';
  static const forgetPasswordTimeValidEmailRoute = '/forget-password-time-valid-email';
  static const forgetPasswordTimeInValidEmailRoute = '/forget-password-time-invalid-email';
  static const forgetPasswordEnterEmailRoute = '/forget-password-enter-email';
  static const editProfileRoute = '/edit-profile';
  static const mainRoute = '/main';
  static const communicationPreferences = '/communication-preferences';
  static const contactUs = '/contact-us';
  static const npowerFaqs = '/npower-faqs';
  static const recipeFilters = '/recipe-filters';
  static const articleFilters = '/article-filters';
  static const signUpStores = '/sign-up-stores';

  // main navigation routes
  static const dashboardRoute = '$mainRoute/dashboard';
  static const newsRoute = '$mainRoute/news';
  static const profileRoute = '$mainRoute/profile';
  static const recipesRoute = '$mainRoute/recipes';
  static const storesRoute = '$mainRoute/stores';
  static const availableCouponsRoute = '$mainRoute/available_coupons_screen';
  static const transactionsItemDetailsRoute = '$mainRoute/transactions-item-details-widget';
  static const latestTransactionsRoute = '$mainRoute/latest_transactions';
  static const clippedCouponsRoute = '$mainRoute/clipped_coupons';
  static const moreWaysToSave = '$mainRoute/more-ways-to-save';
  static const bingoOptions = '$mainRoute/bingo-options';
  static const mealDeals = '$mainRoute/meal-deals';
  static const hotlineMagazine = '$mainRoute/hotline-magazine';
  static const storeDetails = '$mainRoute/store-details';
  static const recipeDetails = '$mainRoute/recipe-details';
  static const articleDetails = '$mainRoute/article-details';

  static const rootNavigationKey = 0;
  static const mainNavigationKey = 1;

  static final List<GetPage> _rootRoutes = [
    GetPage(
      name: splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: onboardingRoute,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: signInRoute,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: signUpRoute,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: forgetPasswordRoute,
      page: () => const ForgetPasswordScreen(),
    ),
    GetPage(
      name: forgetPasswordEnterEmailRoute,
      page: () => const ForgetPasswordEnterEmail(),
    ),
    GetPage(
      name: forgetPasswordTimeValidEmailRoute,
      page: () => const ForgetPasswordTimeValidEmail(),
    ),
    GetPage(
      name: forgetPasswordTimeInValidEmailRoute,
      page: () => const ForgetPasswordTimeInvalidEmail(),
    ),
    GetPage(
      name: editProfileRoute,
      page: () => const EditProfileScreen(),
    ),
    GetPage(
      name: mainRoute,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: communicationPreferences,
      page: () => const CommunicationPreferences(),
    ),
    GetPage(
      name: contactUs,
      page: () => const ContactUs(),
    ),
    GetPage(
      name: npowerFaqs,
      page: () => const NPowerFaqs(),
    ),
    GetPage(
      name: recipeFilters,
      page: () => const RecipeFilters(),
    ),
    GetPage(
      name: articleFilters,
      page: () => const ArticleFilters(),
    ),
    GetPage(
      name: signUpStores,
      page: () => const SignUpStores(),
    )
  ];

  static final List<GetPage> _mainRoutes = [
    GetPage(
      name: dashboardRoute,
      page: () => const DashboardScreen(),
    ),
    GetPage(
      name: newsRoute,
      page: () => const NewsScreen(),
    ),
    GetPage(
      name: recipesRoute,
      page: () => const RecipesAndArticles(),
    ),
    GetPage(
      name: storesRoute,
      page: () => const StoresScreen(),
    ),
    GetPage(
      name: profileRoute,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: latestTransactionsRoute,
      page: () => const LatestTransactionsScreen(),
    ),
    GetPage(
      name: transactionsItemDetailsRoute,
      page: () => const TransactionDetailsScreen(),
    ),
    GetPage(
      name: availableCouponsRoute,
      page: () => const AvailableCouponsScreen(),
    ),
    GetPage(
      name: clippedCouponsRoute,
      page: () => const ClippedCouponsScreen(),
    ),
    GetPage(
      name: moreWaysToSave,
      page: () => const MoreWaysToSave(),
    ),
    GetPage(
      name: bingoOptions,
      page: () => const BingoOptions(),
    ),
    GetPage(
      name: mealDeals,
      page: () => const MealDeals(),
    ),
    GetPage(
      name: hotlineMagazine,
      page: () => const HotlineMagazine(),
    ),
    GetPage(
      name: storeDetails,
      page: () => const StoreDetailsScreen(),
    ),
    GetPage(
      name: recipeDetails,
      page: () => const RecipeDetails(),
    ),
    GetPage(
      name: articleDetails,
      page: () => const ArticleDetails(),
    )
  ];

  static List<GetPage> get rootRoutes => _rootRoutes;

  static List<GetPage> get mainRoutes => _mainRoutes;

  static Future<T?>? goTo<T>(
    String page, {
    bool hasBack = true,
    dynamic arguments,
    int? id = rootNavigationKey,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    if (hasBack) {
      return Get.toNamed(
        page,
        arguments: arguments,
        id: id,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
      );
    }

    return Get.offAllNamed(
      page,
      arguments: arguments,
      parameters: parameters,
      id: id,
    );
  }

  static Future<T?>? goToNested<T>(
    String page, {
    bool hasBack = true,
    dynamic arguments,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      goTo(
        page,
        hasBack: hasBack,
        arguments: arguments,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        id: mainNavigationKey,
      );

  static void back<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id = rootNavigationKey,
  }) {
    Get.back(
      result: result,
      closeOverlays: closeOverlays,
      canPop: canPop,
      id: id,
    );
  }

  static void backNested<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
  }) =>
      back(
        result: result,
        closeOverlays: closeOverlays,
        canPop: canPop,
        id: mainNavigationKey,
      );
}
