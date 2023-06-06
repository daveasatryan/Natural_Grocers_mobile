import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/models/dashboard/transactions/transaction_model.dart';
import 'package:natural_groceries/core/data/utilities/helper.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/latest_transactions/widget/transaction_period_selector/transactions_period_selector.dart';
import 'package:natural_groceries/core/presentation/views/main/latest_transactions/widget/transactions_item_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/empty_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class LatestTransactionsScreen extends StatelessWidget with BaseStatelessMixin {
  const LatestTransactionsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<TransactionModel> transactions =
        ModalRoute.of(context)?.settings.arguments.nullableCast() ?? [];
    return AppScaffold(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 100.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HeaderWidget(
                text: context.strings.latest_transactions,
                textStyle: context.fonts.latoBlackItalic.copyWith(
                  color: context.colors.whiteColor,
                ),
                isNested: true,
                height: 97.sp,
              ),
              SizedBox(height: 5.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 25.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.strings.this_month,
                          style: context.fonts.latoRegularItalic.copyWith(
                            fontSize: 24.sp,
                            color: context.colors.whisperBorderColor,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            // ignore: unused_local_variable
                            final result = await showModalBottomSheet(
                              constraints: BoxConstraints(maxHeight: context.sizes.height * .88),
                              useRootNavigator: true,
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return const TransactionPeriodSelector();
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(7.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              color: context.colors.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: context.colors.profileBorder,
                                  blurRadius: 4,
                                  offset: const Offset(4, 8),
                                ),
                                BoxShadow(
                                  color: context.colors.profileBorder,
                                  blurRadius: 4,
                                  offset: const Offset(-4, 8),
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(AppAssets.filterIcon),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25.sp),
                    transactions.isEmpty
                        ? CustomEmptyWidget(
                            icon: AppAssets.emptyTransactionIcon,
                            text: context.strings.no_transactions_available,
                          )
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: transactions.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => AppRoutes.goToNested(
                                  AppRoutes.transactionsItemDetailsRoute,
                                  arguments: transactions[index].basketId,
                                ),
                                child: TransactionsItemWidget(
                                  amount:
                                      transactions[index].transactionTotalAmount?.toString() ?? '0',
                                  date: transactions[index].date,
                                  earned: transactions[index].transactionId?.toString() ?? '0',
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
