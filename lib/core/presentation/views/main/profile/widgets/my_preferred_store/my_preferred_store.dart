import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/enums/bottom_nav_enum.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/widgets/my_preferred_store/bloc/my_preferred_store_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/widgets/my_preferred_store/bloc/my_preferred_store_event.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/widgets/my_preferred_store/bloc/my_preferred_store_state.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';
import 'package:natural_groceries/core/presentation/widgets/bottom_nav_bar/bloc/bottom_nav_bar_bloc.dart';
import 'package:natural_groceries/core/presentation/widgets/bottom_nav_bar/bloc/bottom_nav_bar_event.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';

class MyPreferredStore extends StatelessWidget with BaseStatelessMixin {
  final String? preferredStore;

  const MyPreferredStore({
    super.key,
    required this.preferredStore,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<BlocFactory>().create<MyPreferredStoreBloc>()
        ..add(const MyPreferredStoreEvent.getStores()),
      child: BlocConsumer<MyPreferredStoreBloc, MyPreferredStoreState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (msg) => showErrorDialog(context, msg: msg),
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            success: (stores) {
              final store = stores.firstWhereOrNull((store) => store.nid == preferredStore);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    store?.fullTitle ?? '',
                    style: context.fonts.latoRegularItalic.copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: 10.sp),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.locationIcon),
                      SizedBox(width: 5.sp),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context
                                .read<BottomNavBarBloc>()
                                .add(const BottomNavBarEvent.changePage(BottomNavEnum.stores));
                            AppRoutes.goToNested(
                              AppRoutes.storesRoute,
                              hasBack: false,
                            ); //! todo: navigate to MAP
                          },
                          child: Text(
                            store?.address ?? '',
                            style: context.fonts.latoBold.copyWith(
                              color: context.colors.orangeColor,
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.sp),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      color: context.colors.borderTrueColor,
                      padding: EdgeInsets.symmetric(
                        vertical: 12.sp,
                        horizontal: 16.sp,
                      ),
                      onTap: () {
                        context
                            .read<BottomNavBarBloc>()
                            .add(const BottomNavBarEvent.changePage(BottomNavEnum.stores));
                        AppRoutes.goToNested(
                          AppRoutes.storesRoute,
                          hasBack: false,
                        );
                      },
                      isColorFilled: false,
                      child: Text(
                        context.strings.see_store_details,
                        style: context.fonts.latoBold.copyWith(
                          fontSize: 16.sp,
                          color: context.colors.whiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
