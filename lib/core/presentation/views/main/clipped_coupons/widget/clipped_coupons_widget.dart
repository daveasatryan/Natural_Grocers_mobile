import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural_groceries/core/data/enums/offer_type_enum.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/coupon_item_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/coupons/bloc/coupons_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/coupons/bloc/coupons_event.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/coupons/bloc/coupons_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/empty_widget.dart';

class ClippedCouponsWidget extends StatelessWidget {
  const ClippedCouponsWidget({
    super.key,
    required this.type,
  });

  final OfferTypeEnum type;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          context.read<BlocFactory>().create<CouponsBloc>()..add(CouponsEvent.getCoupons(type)),
      child: BlocBuilder<CouponsBloc, CouponsState>(
        builder: (context, state) => state.when(
          loading: () => const Center(child: CircularProgressIndicator.adaptive()),
          success: (coupons) => coupons.isEmpty
              ? CustomEmptyWidget(text: context.strings.no_coupons_available)
              : DynamicHeightGridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: coupons.length,
                  crossAxisCount: 2,
                  builder: (context, index) {
                    return CouponItemWidget(
                      coupon: coupons[index],
                      type: type,
                    );
                  },
                ),
        ),
      ),
    );
  }
}
