import 'package:auto_size_text/auto_size_text.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/enums/offer_type_enum.dart';
import 'package:natural_groceries/core/data/enums/single_character_radio.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/coupon_item_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/coupons/bloc/coupons_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/coupons/bloc/coupons_event.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/coupons/bloc/coupons_state.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/empty_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class AvailableCouponsScreen extends StatefulWidget {
  const AvailableCouponsScreen({
    super.key,
  });

  @override
  State<AvailableCouponsScreen> createState() => _AvailableCouponsScreenState();
}

class _AvailableCouponsScreenState extends State<AvailableCouponsScreen> with BaseStateMixin {
  SingingCharacterRadio? character = SingingCharacterRadio.year;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 100.sp),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              HeaderWidget(
                headerWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      strings.available_coupons,
                      style: fonts.latoBlackItalic.copyWith(
                        color: context.colors.whiteColor,
                        fontSize: 26.sp,
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(width: 10.sp),
                    SvgPicture.asset(AppAssets.availableCouponsIcons)
                  ],
                ),
                isNested: true,
                height: 97.sp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                child: BlocProvider(
                  create: (context) => context.read<BlocFactory>().create<CouponsBloc>()
                    ..add(
                      const CouponsEvent.getCoupons(
                        OfferTypeEnum.available,
                      ),
                    ),
                  child: BlocBuilder<CouponsBloc, CouponsState>(
                    builder: (context, state) => state.when(
                      loading: () => Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.sp),
                        child: const CircularProgressIndicator.adaptive(),
                      ),
                      success: (coupons) => coupons.isEmpty
                          ? CustomEmptyWidget(
                              text: context.strings.no_coupons_available,
                            )
                          : DynamicHeightGridView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 10,
                              itemCount: coupons.length,
                              builder: (ctx, index) {
                                return InkWell(
                                  onTap: () {
                                    // showModalBottomSheet(
                                    //   constraints:
                                    //       BoxConstraints(maxHeight: context.sizes.height * .74),
                                    //   useRootNavigator: true,
                                    //   context: context,
                                    //   isScrollControlled: true,
                                    //   backgroundColor: Colors.transparent,
                                    //   builder: (context) {
                                    //      return CouponItemBottomSheetWidget(
                                    //        date: widget.date,
                                    //        icon: AppAssets.clipIcon,
                                    //        save: widget.save,
                                    //        name: widget.name,
                                    //      );
                                    //   },
                                    // );
                                  },
                                  child: CouponItemWidget(
                                    coupon: coupons[index],
                                    type: OfferTypeEnum.available,
                                  ),
                                );
                              },
                              crossAxisCount: 2,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
