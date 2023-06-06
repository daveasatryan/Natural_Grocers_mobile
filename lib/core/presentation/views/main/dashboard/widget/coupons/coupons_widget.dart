import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/offer_type_enum.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/coupon_item_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/coupons/bloc/coupons_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/coupons/bloc/coupons_event.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/coupons/bloc/coupons_state.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/title_header_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class CouponsWidget extends StatelessWidget with BaseStatelessMixin {
  const CouponsWidget({
    super.key,
    this.isAvailable = true,
  });

  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleHeaderDashboardWidget(
          title: isAvailable ? context.strings.available_coupons : context.strings.clipped_coupons,
          style: context.fonts.latoRegularItalic.copyWith(
            fontSize: 18.sp,
            color: context.colors.whisperBorderColor,
          ),
          onTap: () => isAvailable
              ? AppRoutes.goToNested(AppRoutes.availableCouponsRoute)
              : AppRoutes.goToNested(AppRoutes.clippedCouponsRoute),
        ),
        SizedBox(height: 15.sp),
        BlocProvider(
          create: (context) => context.read<BlocFactory>().create<CouponsBloc>()
            ..add(
              CouponsEvent.getCoupons(
                isAvailable ? OfferTypeEnum.available : OfferTypeEnum.selected,
              ),
            ),
          child: BlocBuilder<CouponsBloc, CouponsState>(
            builder: (context, state) => state.when(
              loading: () => const CircularProgressIndicator.adaptive(),
              success: (coupons) => coupons.isEmpty
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        isAvailable
                            ? context.strings.no_coupons_available
                            : context.strings.you_havent_clipped_any_coupons_yet,
                        style: context.fonts.latoMedium.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    )
                  : DynamicHeightGridView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: coupons.length > 2 ? 2 : coupons.length,
                      crossAxisCount: 2,
                      builder: (context, index) {
                        return CouponItemWidget(
                          coupon: coupons[index],
                          type: isAvailable ? OfferTypeEnum.available : OfferTypeEnum.expired,
                        );
                      },
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
