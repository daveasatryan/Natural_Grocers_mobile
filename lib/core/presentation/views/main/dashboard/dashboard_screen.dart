import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/coupons/coupons_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/dashboard_header_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/latest_transactions/latest_transactions_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/more_ways_to_save_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/my_coupons_savings_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/my_progres_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/title_header_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with BaseStateMixin {
  final bool check = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AppScaffold(
        child: Scaffold(
          backgroundColor: context.colors.whiteColor,
          body: SizedBox(
            width: sizes.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 100.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const DashboardHeaderWidget(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.sp,
                        right: 10.sp,
                      ),
                      child: Column(
                        children: [
                          const MyProgresWidget(),
                          const LatestTransactionsWidget(),
                          TitleHeaderDashboardWidget(
                            title: strings.my_coupons_savings,
                            showSeeAllButton: false,
                          ),
                          SizedBox(height: 10.sp),
                          const MyCouponsSavings(),
                          SizedBox(height: 30.sp),
                          const CouponsWidget(isAvailable: true),
                          SizedBox(height: 30.sp),
                          const CouponsWidget(isAvailable: false),
                          SizedBox(height: 24.sp),
                          TitleHeaderDashboardWidget(
                            title: context.strings.more_ways_to_save,
                            onTap: () => AppRoutes.goToNested(AppRoutes.moreWaysToSave),
                          ),
                          SizedBox(height: 14.sp),
                          const MoreWaysToSaveWidget(),
                          SizedBox(height: 20.sp),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
