import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/models/dashboard/transactions/transaction_model.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/latest_transaction_item_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/latest_transactions/bloc/latest_transactions_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/latest_transactions/bloc/latest_transactions_event.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/latest_transactions/bloc/latest_transactions_state.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/title_header_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class LatestTransactionsWidget extends StatelessWidget with BaseStatelessMixin {
  const LatestTransactionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<TransactionModel> transactions = [];
    return Column(
      children: [
        TitleHeaderDashboardWidget(
          title: context.strings.latest_transactions,
          onTap: () =>
              AppRoutes.goToNested(AppRoutes.latestTransactionsRoute, arguments: transactions),
        ),
        SizedBox(height: 14.sp),
        BlocProvider(
          create: (context) => context.read<BlocFactory>().create<LatestTransactionsBloc>()
            ..add(const LatestTransactionsEvent.getTransactions()),
          child: BlocBuilder<LatestTransactionsBloc, LatestTransactionsState>(
            builder: (context, state) => state.when(
              loading: () => const CircularProgressIndicator.adaptive(),
              success: (data) {
                transactions = data;
                return Container(
                  padding: EdgeInsets.only(bottom: 35.sp),
                  child: Column(
                    children: [
                      SizedBox(height: 5.sp),
                      transactions.isEmpty
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                context.strings.no_transactions_available,
                                textAlign: TextAlign.center,
                                style: context.fonts.latoMedium.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: transactions.length >= 3 ? 3 : transactions.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final model = transactions[index];
                                return LatestTransactionItemWidget(
                                  perEarned: 'point', // todo: set points
                                  date: model.date,
                                  amount: model.transactionTotalAmount.toString(),
                                );
                              },
                            )
                    ],
                  ),
                );
              },
              error: (msg) => Center(
                child: Text(
                  context.strings.no_transactions_available,
                  textAlign: TextAlign.center,
                  style: context.fonts.latoMedium.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
