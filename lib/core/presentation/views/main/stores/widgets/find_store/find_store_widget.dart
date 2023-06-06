import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/bloc/stores_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/bloc/stores_event.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/find_store/bloc/find_store_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/find_store/bloc/find_store_event.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/find_store/widgets/list_store_view.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/find_store/widgets/map_store_view.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_text_filed.dart';

class FindStoreWidget extends StatefulWidget {
  const FindStoreWidget({super.key});

  @override
  State<FindStoreWidget> createState() => _FindStoreWidgetState();
}

class _FindStoreWidgetState extends State<FindStoreWidget> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _debounce = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listType = context.read<StoresBloc>().findStoreListType;
    final stores = context.read<StoresBloc>().stores;
    final bloc = context.read<BlocFactory>().create<FindStoreBloc>();
    return BlocProvider(
      create: (context) => bloc,
      child: Stack(
        children: [
          listType == ListViewType.mapView
              ? MapStoreView(stores: stores)
              : ListStoreView(stores: stores),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 11.sp),
                child: CustomTextField(
                  hint: context.strings.search_field_hint,
                  hintStyle: context.fonts.latoMediumItalic
                      .copyWith(color: context.colors.greyShade80, fontSize: 18.sp),
                  labelText: '',
                  fillColor: context.colors.whiteColor,
                  contentPaddingVertical: 8.sp,
                  borderColor: context.colors.appSecondaryColor,
                  prefixIcon: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.sp),
                    margin: EdgeInsets.all(5.sp),
                    decoration:
                        BoxDecoration(color: context.colors.mainAppColor, shape: BoxShape.circle),
                    child: Icon(Icons.search, color: context.colors.whiteColor, size: 25.sp),
                  ),
                  onChanged: (value) {
                    if (_debounce?.isActive == true) _debounce?.cancel();

                    _debounce = Timer(const Duration(milliseconds: 500), () {
                      bloc.add(FindStoreEvent.search(value));
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.sp, right: 20.sp, left: 20.sp),
                child: Row(
                  mainAxisAlignment: listType == ListViewType.listView
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  children: [
                    if (listType == ListViewType.listView)
                      Text(
                        '${stores.length.toString()} ${context.strings.results}',
                        style: context.fonts.latoMedium.copyWith(
                          fontSize: 20.sp,
                          color: context.colors.whisperOpacityColor,
                        ),
                      ),
                    Align(
                      alignment: Alignment.topRight,
                      child: CustomButton(
                        onTap: () => context.read<StoresBloc>().add(
                          StoresEvent.changeListViewType(
                            type: listType == ListViewType.mapView
                                ? ListViewType.listView
                                : ListViewType.mapView,
                          ),
                        ),
                        isColorFilled: true,
                        color: context.colors.purple,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 14.sp),
                          child: Text(
                            listType.titleInStores,
                            style: context.fonts.latoBoldItalic.copyWith(
                              fontSize: 16.sp,
                              color: context.colors.listViewTypeColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
