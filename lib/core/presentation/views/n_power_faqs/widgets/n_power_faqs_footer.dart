import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/n_power_faqs_enum.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/n_power_faqs/bloc/n_power_faqs_bloc.dart';
import 'package:natural_groceries/core/presentation/views/n_power_faqs/bloc/n_power_faqs_event.dart';
import 'package:natural_groceries/core/presentation/views/n_power_faqs/bloc/n_power_faqs_state.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/tab_bar_indicator.dart';

class NPowerFaqsFooter extends StatefulWidget {
  const NPowerFaqsFooter({super.key});

  @override
  State<NPowerFaqsFooter> createState() => _NPowerFaqsFooterState();
}

class _NPowerFaqsFooterState extends State<NPowerFaqsFooter>
    with SingleTickerProviderStateMixin, BaseStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 5,
      vsync: this,
      animationDuration: const Duration(milliseconds: 100),
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<BlocFactory>().create<NPowerFaqsBloc>()
        ..add(const NPowerFaqsEvent.getFaqs()),
      child: BlocConsumer<NPowerFaqsBloc, NPowerFaqsState>(
        buildWhen: (prev, cur) => cur.buildWhen(),
        listenWhen: (prev, cur) => cur.listenWhen(),
        listener: (context, state) {
          state.whenOrNull(error: (msg) => showErrorDialog(msg: msg));
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            initial: (nPowerFaqsEnum, faqs) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TabBar(
                    controller: _tabController,
                    labelPadding: EdgeInsets.symmetric(horizontal: 5.sp),
                    labelColor: context.colors.blackOpacityColor,
                    unselectedLabelColor: context.colors.tabGreyColor,
                    unselectedLabelStyle: context.fonts.latoMediumItalic
                        .copyWith(color: context.colors.tabGreyColor, fontSize: 14.sp),
                    labelStyle: context.fonts.latoBoldItalic.copyWith(fontSize: 14.sp),
                    isScrollable: true,
                    indicator: MyTabBarIndicator(
                      bottomLeftRadius: 100.sp,
                      bottomRightRadius: 100.sp,
                      topLeftRadius: 100.sp,
                      topRightRadius: 100.sp,
                      indicatorWidth: 31.sp,
                      color: context.colors.tabIndicatorColor,
                      paintingStyle: PaintingStyle.fill,
                    ),
                    onTap: (index) {
                      context.read<NPowerFaqsBloc>().add(
                            NPowerFaqsEvent.changeTab(
                              nPowerFaqsEnum: NPowerFaqsEnum.fromIndex(index),
                            ),
                          );
                    },
                    tabs: NPowerFaqsEnum.values
                        .map(
                          (e) => Tab(
                            child: Text(e.tabTitle),
                          ),
                        ).toList(),
                  ),
                  SizedBox(height: 15.sp),
                  nPowerFaqsEnum.widget(faqs),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
