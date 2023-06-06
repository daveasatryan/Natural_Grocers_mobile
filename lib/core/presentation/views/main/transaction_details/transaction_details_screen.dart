import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/models/dashboard/transactions/transaction_model.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/data/utilities/helper.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/transaction_details/bloc/transaction_details_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/transaction_details/bloc/transaction_details_event.dart';
import 'package:natural_groceries/core/presentation/views/main/transaction_details/bloc/transaction_details_state.dart';
import 'package:natural_groceries/core/presentation/views/main/transaction_details/widgets/transaction_item_details_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class TransactionDetailsScreen extends StatelessWidget with BaseStatelessMixin {
  const TransactionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? transactionId = ModalRoute.of(context)?.settings.arguments?.toString();
    return BlocProvider(
      create: (context) => context.read<BlocFactory>().create<TransactionDetailsBloc>()
        ..add(TransactionDetailsEvent.getTransactionDetails(transactionId)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              text: context.strings.latest_transactions,
              textStyle: context.fonts.latoBlackItalic.copyWith(
                color: context.colors.whiteColor,
              ),
              isNested: true,
              height: 130.sp,
            ),
            SizedBox(height: 10.sp),
            BlocConsumer<TransactionDetailsBloc, TransactionDetailsState>(
              buildWhen: (_, current) => current.buildWhen(),
              listenWhen: (_, current) => current.listenWhen(),
              listener: (context, state) => state.whenOrNull(
                error: (msg) => showErrorDialog(context, msg: msg),
              ),
              builder: (context, state) => state.maybeWhen(
                orElse: () => Container(),
                loading: () => const CircularProgressIndicator.adaptive(),
                success: (transaction) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 25.sp,
                    horizontal: 15.sp,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.sp,
                      horizontal: 12.sp,
                    ),
                    decoration: BoxDecoration(
                      color: context.colors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: context.colors.profileBorder,
                          blurRadius: 4,
                          offset: const Offset(4, 8),
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(14.sp),
                      ),
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: context.colors.profileBorder,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          transaction?.storeId.toString() ?? '', // todo: set store address
                          style: context.fonts.latoBlack.copyWith(
                            fontSize: 14.sp,
                            color: context.colors.borderTrueColor,
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5.sp),
                                  decoration: BoxDecoration(
                                    color: context.colors.borderTrueColor,
                                    borderRadius: BorderRadius.circular(100.sp),
                                  ),
                                  child: SvgPicture.asset(AppAssets.addIcon),
                                ),
                                SizedBox(width: 5.sp),
                                Text(
                                  context.strings.pts_earned(transaction?.loyalty
                                          ?.sum((element) => element.pointsEarned ?? 0)
                                          .toDouble() ??
                                      0),
                                  style: context.fonts.latoBlack.copyWith(
                                    color: context.colors.borderTrueColor,
                                    fontSize: 14.sp,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Text(
                                transaction?.date ?? '',
                                style: context.fonts.latoMedium.copyWith(
                                  fontSize: 14.sp,
                                  color: context.colors.whisperBorderColor,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.sp),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                context.strings.product_description,
                                style: context.fonts.latoRegularItalic,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                context.strings.quantity,
                                style: context.fonts.latoRegularItalic,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                context.strings.amount,
                                style: context.fonts.latoRegularItalic,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.sp),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: context.colors.whisperBorderColor,
                              ),
                            ),
                          ),
                          child: ListView.builder(
                            itemCount: transaction?.offers?.length ?? 0,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final model = transaction?.offers?.getOrNull(index);
                              return TransactionItemDetailsWidget(
                                desc: model?.shortDescriotion ?? '',
                                amount: model?.value?.toDouble() ?? .0,
                                quantity: model?.redeemCount ?? 0,
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 15.sp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              context.strings.total,
                              style: context.fonts.latoBlack.copyWith(
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(width: 15.sp),
                            Text(
                              '\$${transaction?.transactionTotalAmount ?? 0}',
                              style: context.fonts.latoBlack.copyWith(
                                fontSize: 14.sp,
                                color: context.colors.greenAmountColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.sp),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
