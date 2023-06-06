import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/utilities/date_utilities.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/dashboard_product_item_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class MyAvailableCouponsWidget extends StatelessWidget with BaseStatelessMixin {
  const MyAvailableCouponsWidget({
    super.key,
  });

  final bool check = true;

  @override
  Widget build(BuildContext context) {
    return check
        ? Align(
            alignment: Alignment.topLeft,
            child: Text(
              context.strings.no_coupons_available,
              textAlign: TextAlign.center,
              style: context.fonts.latoMedium.copyWith(
                fontSize: 12.sp,
              ),
            ),
          )
        : AspectRatio(
            aspectRatio: 375 / 177,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return DashboardProductItemWidget(
                  date: DateUtilities.printDateLine,
                  name: 'Gaia Herbs',
                  save: 3.0,
                );
              },
            ),
          );
  }
}
