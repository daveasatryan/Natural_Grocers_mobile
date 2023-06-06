import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/data/enums/store_page_type.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/bloc/stores_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/bloc/stores_event.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/bloc/stores_state.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        backgroundColor: context.colors.whiteColor,
        body: BlocProvider(
          create: (context) =>
              context.read<BlocFactory>().create<StoresBloc>()..add(const StoresEvent.getStores()),
          child: BlocBuilder<StoresBloc, StoresState>(
            builder: (context, state) => state.when(
              loading: () => const Center(child: CircularProgressIndicator.adaptive()),
              currentPage: (page, showLoading) {
                hideLoading();
                return page == StorePageType.findStore &&
                        context.read<StoresBloc>().findStoreListType == ListViewType.mapView
                    ? _content(context, page, showLoading)
                    : SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 100.sp),
                          child: _content(context, page, showLoading),
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }

  Column _content(BuildContext context, StorePageType page, bool showLoading) {
    return Column(
      mainAxisSize: page == StorePageType.findStore &&
              context.read<StoresBloc>().findStoreListType == ListViewType.mapView
          ? MainAxisSize.max
          : MainAxisSize.min,
      children: [
        HeaderWidget(
          text: context.strings.stores,
          hasBack: false,
          height: 97.sp,
        ),
        SizedBox(height: 24.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: StorePageType.values
              .map(
                (e) => InkWell(
                  onTap: () => context.read<StoresBloc>().add(
                        StoresEvent.changePage(e),
                      ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.title,
                        style: (e == page
                                ? context.fonts.latoBoldItalic
                                : context.fonts.latoRegularItalic)
                            .copyWith(
                          fontSize: 24.sp,
                          color: e == page ? colors.blackOpacityColor : colors.whisperOpacityColor,
                        ),
                      ),
                      SizedBox(height: 8.sp),
                      if (e == page)
                        Container(
                          height: 4.sp,
                          width: 51.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: context.colors.orangeBorderColor,
                          ),
                        )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(height: 10.sp),
        if (showLoading)
          const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        if (!showLoading)
          if (page == StorePageType.findStore &&
              context.read<StoresBloc>().findStoreListType == ListViewType.mapView)
            Expanded(child: page.widget)
          else
            page.widget,
      ],
    );
  }
}
