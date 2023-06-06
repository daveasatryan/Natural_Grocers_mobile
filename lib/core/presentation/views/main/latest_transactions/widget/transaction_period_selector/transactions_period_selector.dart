import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/single_character_radio.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/data/utilities/date_utilities.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/latest_transactions/widget/transaction_period_selector/bloc/transaction_period_selector_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/latest_transactions/widget/transaction_period_selector/bloc/transaction_period_selector_event.dart';
import 'package:natural_groceries/core/presentation/views/main/latest_transactions/widget/transaction_period_selector/bloc/transaction_period_selector_state.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TransactionPeriodSelector extends StatefulWidget {
  const TransactionPeriodSelector({
    super.key,
  });

  @override
  State<TransactionPeriodSelector> createState() => _TransactionPeriodSelectorState();
}

class _TransactionPeriodSelectorState extends State<TransactionPeriodSelector> with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<BlocFactory>().create<TransactionPeriodSelectorBloc>(),
      child: BlocConsumer<TransactionPeriodSelectorBloc, TransactionPeriodSelectorState>(
        buildWhen: (_, current) => current.buildWhen(),
        listenWhen: (_, current) => current.listenWhen(),
        listener: (context, state) => state.whenOrNull(
          success: () {
            return null;
          },
          loading: () => showLoading(),
          error: (msg, code) => showErrorDialog(msg: msg),
        ),
        builder: (context, state) => state.maybeWhen(
          orElse: () => Container(),
          initialRadio: (character, showDate, startDate, endDate) {
            hideLoading();
            return Container(
              decoration: BoxDecoration(
                color: context.colors.whiteColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.sp),
                  topLeft: Radius.circular(40.sp),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 40.sp,
                        top: 25.sp,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: context.sizes.width * .27,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: context.colors.dividerColor,
                                    width: 4,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          Text(
                            context.strings.filter_by,
                            style: context.fonts.latoBlack.copyWith(
                              fontSize: 24.sp,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(height: 20.sp),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            onTap: () {
                              context.read<TransactionPeriodSelectorBloc>().add(
                                    const TransactionPeriodSelectorEvent.togglePeriod(
                                        character: SingingCharacterRadio.month),
                                  );
                            },
                            minLeadingWidth: 0.sp,
                            title: Text(
                              context.strings.this_month,
                              style: context.fonts.latoRegularItalic.copyWith(
                                fontSize: 18.sp,
                                color: character == SingingCharacterRadio.month
                                    ? context.colors.greenScreenColor
                                    : context.colors.blackOpacityColor,
                              ),
                            ),
                            leading: Container(
                              height: 23.sp,
                              width: 23.sp,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.sp,
                                  color: context.colors.whisperBorderColor,
                                ),
                                color: context.colors.greenScreenColor,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(
                                (character == SingingCharacterRadio.month ? 5.sp : 0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: context.colors.whiteColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1.sp,
                                    color: character == SingingCharacterRadio.month
                                        ? context.colors.whisperBorderColor
                                        : context.colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            onTap: () {
                              context.read<TransactionPeriodSelectorBloc>().add(
                                    const TransactionPeriodSelectorEvent.togglePeriod(
                                      character: SingingCharacterRadio.quarter,
                                    ),
                                  );
                            },
                            minLeadingWidth: 0.sp,
                            title: Text(
                              context.strings.this_quarter,
                              style: context.fonts.latoRegularItalic.copyWith(
                                fontSize: 18.sp,
                                color: character == SingingCharacterRadio.quarter
                                    ? context.colors.greenScreenColor
                                    : context.colors.blackOpacityColor,
                              ),
                            ),
                            leading: Container(
                              height: 23.sp,
                              width: 23.sp,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.sp,
                                  color: context.colors.whisperBorderColor,
                                ),
                                color: context.colors.greenScreenColor,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(
                                (character == SingingCharacterRadio.quarter ? 5.sp : 0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: context.colors.whiteColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1.sp,
                                    color: character == SingingCharacterRadio.quarter
                                        ? context.colors.whisperBorderColor
                                        : context.colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            onTap: () {
                              context.read<TransactionPeriodSelectorBloc>().add(
                                  const TransactionPeriodSelectorEvent.togglePeriod(
                                      character: SingingCharacterRadio.year));
                            },
                            minLeadingWidth: 0.sp,
                            title: Text(
                              context.strings.this_year,
                              style: context.fonts.latoRegularItalic.copyWith(
                                fontSize: 18.sp,
                                color: character == SingingCharacterRadio.year
                                    ? context.colors.greenScreenColor
                                    : context.colors.blackOpacityColor,
                              ),
                            ),
                            leading: Container(
                              height: 23.sp,
                              width: 23.sp,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.sp,
                                  color: context.colors.whisperBorderColor,
                                ),
                                color: context.colors.greenScreenColor,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(
                                (character == SingingCharacterRadio.year ? 5.sp : 0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: context.colors.whiteColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1.sp,
                                    color: character == SingingCharacterRadio.year
                                        ? context.colors.whisperBorderColor
                                        : context.colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            onTap: () {
                              context.read<TransactionPeriodSelectorBloc>().add(
                                  const TransactionPeriodSelectorEvent.togglePeriod(
                                      character: SingingCharacterRadio.dateRange));
                            },
                            minLeadingWidth: 0.sp,
                            title: Text(
                              context.strings.custom_Date_range,
                              style: context.fonts.latoRegularItalic.copyWith(
                                fontSize: 18.sp,
                                color: character == SingingCharacterRadio.dateRange
                                    ? context.colors.greenScreenColor
                                    : context.colors.blackOpacityColor,
                              ),
                            ),
                            leading: Container(
                              height: 23.sp,
                              width: 23.sp,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.sp,
                                  color: context.colors.whisperBorderColor,
                                ),
                                color: context.colors.greenScreenColor,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(
                                (character == SingingCharacterRadio.dateRange ? 5.sp : 0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: context.colors.whiteColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1.sp,
                                    color: character == SingingCharacterRadio.dateRange
                                        ? context.colors.whisperBorderColor
                                        : context.colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25.sp),
                        ],
                      ),
                    ),
                    showDate
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.sp),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    context.strings.select_custom_date_range,
                                    style: context.fonts.latoBlackItalic.copyWith(
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15.sp),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            context.strings.start_date,
                                            style: context.fonts.latoMediumItalic.copyWith(
                                              color: context.colors.whisperBorderColor,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10.sp,
                                            ),
                                            child: Text(
                                              startDate ?? '',
                                              style: context.fonts.latoBlack.copyWith(
                                                color: context.colors.black45Color,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40.sp,
                                      child: VerticalDivider(
                                        color: context.colors.verticalBorderColor,
                                      ),
                                    ),
                                    Expanded(
                                      //color: colors.black,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            context.strings.end_date,
                                            style: context.fonts.latoMediumItalic.copyWith(
                                              color: context.colors.whisperBorderColor,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10.sp,
                                            ),
                                            child: Text(
                                              endDate ?? '',
                                              style: context.fonts.latoBlack.copyWith(
                                                color: context.colors.black45Color,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.sp),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: context.colors.verticalBorderColor,
                                        width: 0.5.sp,
                                      ),
                                    ),
                                  ),
                                  child: SfDateRangePicker(
                                    view: DateRangePickerView.month,
                                    headerStyle: DateRangePickerHeaderStyle(
                                      textStyle: context.fonts.latoMediumItalic.copyWith(
                                        fontSize: 20.sp,
                                        color: context.colors.whisperBorderColor,
                                      ),
                                    ),
                                    startRangeSelectionColor: context.colors.orangeColor,
                                    endRangeSelectionColor: context.colors.orangeColor,
                                    rangeSelectionColor: context.colors.dateSelectedRangeColor,
                                    monthViewSettings: DateRangePickerMonthViewSettings(
                                      dayFormat: 'EEE',
                                      viewHeaderStyle: DateRangePickerViewHeaderStyle(
                                        textStyle: context.fonts.latoMediumItalic.copyWith(
                                          fontSize: 14.sp,
                                          color: context.colors.whisperBorderColor,
                                        ),
                                      ),
                                    ),
                                    monthCellStyle: DateRangePickerMonthCellStyle(
                                      textStyle: context.fonts.latoBold.copyWith(
                                        fontSize: 14.sp,
                                        color: context.colors.textDateColor,
                                      ),
                                      todayTextStyle: context.fonts.latoBold.copyWith(
                                        fontSize: 14.sp,
                                        color: context.colors.textDateColor,
                                      ),
                                    ),
                                    todayHighlightColor: context.colors.whiteColor,
                                    selectionTextStyle: context.fonts.latoBold.copyWith(
                                      fontSize: 16.sp,
                                      color: context.colors.whiteColor,
                                    ),
                                    rangeTextStyle: context.fonts.latoBold.copyWith(
                                      fontSize: 16.sp,
                                      color: context.colors.orangeColor,
                                    ),
                                    navigationDirection:
                                        DateRangePickerNavigationDirection.vertical,
                                    navigationMode: DateRangePickerNavigationMode.scroll,
                                    onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                                      String start =
                                          DateUtilities.printStartEndDates(args.value.startDate);
                                      String end = DateUtilities.printStartEndDates(
                                        args.value.endDate ?? args.value.startDate,
                                      );
                                      context.read<TransactionPeriodSelectorBloc>().add(
                                            TransactionPeriodSelectorEvent.togglePeriod(
                                              character: SingingCharacterRadio.dateRange,
                                              startDate: start,
                                              endDate: end,
                                            ),
                                          );
                                    },
                                    selectionMode: DateRangePickerSelectionMode.range,
                                  ),
                                )
                              ],
                            ),
                          )
                        : const SizedBox(),
                    Container(
                      decoration: BoxDecoration(
                        color: context.colors.appSecondaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60.sp),
                          topLeft: Radius.circular(60.sp),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 32,
                          horizontal: 50.sp,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomButton(
                                borderColor: context.colors.borderTrueColor,
                                showBorder: true,
                                isColorFilled: false,
                                onTap: () {},
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.sp,
                                  horizontal: 12.sp,
                                ),
                                child: Center(
                                  child: Text(
                                    context.strings.clear_filters,
                                    style: context.fonts.latoRegular.copyWith(
                                      color: context.colors.borderTrueColor,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15.sp),
                            Expanded(
                              flex: 1,
                              child: CustomButton(
                                color: context.colors.borderTrueColor,
                                isColorFilled: false,
                                onTap: () {},
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.sp,
                                  horizontal: 12.sp,
                                ),
                                child: Center(
                                  child: Text(
                                    context.strings.apply,
                                    style: context.fonts.latoRegular.copyWith(
                                      color: context.colors.whiteColor,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
