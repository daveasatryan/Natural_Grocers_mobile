import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_up_store_screen/bloc/sign_up_store_bloc.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_up_store_screen/bloc/sign_up_store_event.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_up_store_screen/bloc/sign_up_store_state.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_up_store_screen/widgets/sign_up_list_store_view.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_up_store_screen/widgets/sign_up_map_store_view.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/base_app_bar_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_text_filed.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class SignUpStores extends StatefulWidget {
  const SignUpStores({super.key});

  @override
  State<SignUpStores> createState() => _SignUpStoresState();
}

class _SignUpStoresState extends State<SignUpStores> with BaseStateMixin {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _debounce = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        appBar: BaseAppBarWidget(
          title: SvgPicture.asset(AppAssets.logoIcon),
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(AppAssets.backIcon),
            ),
          ),
        ),
        body: BlocProvider(
          create: (context) => context.read<BlocFactory>().create<SignUpStoreBloc>()
            ..add(const SignUpStoreEvent.getStores()),
          child: BlocConsumer<SignUpStoreBloc, SignUpStoreState>(
            listener: (context, state) {
              state.whenOrNull(error: (msg) => showErrorDialog(msg: msg));
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => Container(),
                loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                success: (stores, listType, searchKey) {
                  return listType == ListViewType.mapView
                      ? Center(child: _content(context, listType, stores, searchKey ?? ''))
                      : SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 100.sp),
                            child: _content(context, listType, stores, searchKey ?? ''),
                          ),
                        );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _content(
      BuildContext context, ListViewType listType, List<StoreModel> stores, String searchKey) {
    return Stack(
      children: [
        listType == ListViewType.mapView
            ? SignUpMapStoreView(stores: stores)
            : Padding(
                padding: EdgeInsets.only(top: 140.sp),
                child: SignUpListStoreView(stores: stores, searchKey: searchKey),
              ),
        HeaderWidget(
          text: context.strings.title_set_your_preferred_store,
          hasBack: false,
          headerImagePath: AppAssets.signUpPreferredStoreImage,
          height: 103.sp,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 11.sp,
            right: 11.sp,
            top: 90.sp,
          ),
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
              decoration: BoxDecoration(color: context.colors.mainAppColor, shape: BoxShape.circle),
              child: Icon(Icons.search, color: context.colors.whiteColor, size: 25.sp),
            ),
            onChanged: (value) {
              if (_debounce?.isActive == true) _debounce?.cancel();

              _debounce = Timer(const Duration(milliseconds: 500), () {
                context.read<SignUpStoreBloc>().add(SignUpStoreEvent.search(value));
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 140.sp, right: 20.sp, left: 20.sp),
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
              CustomButton(
                onTap: () => context.read<SignUpStoreBloc>().add(
                      SignUpStoreEvent.toggleListView(
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
            ],
          ),
        )
      ],
    );
  }

  Widget mainView(
      BuildContext context, ListViewType listType, List<StoreModel> stores, String searchKey) {
    return Stack(
      children: [
        listType == ListViewType.mapView
            ? SignUpMapStoreView(stores: stores)
            : SignUpListStoreView(stores: stores, searchKey: searchKey),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.sp),
              child: CustomTextField(
                hint: context.strings.search,
                hintStyle: context.fonts.latoMediumItalic
                    .copyWith(color: context.colors.greyShade80, fontSize: 20.sp),
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
                    context.read<SignUpStoreBloc>().add(SignUpStoreEvent.search(value));
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.sp, right: 20.sp),
              child: Align(
                alignment: Alignment.topRight,
                child: CustomButton(
                  onTap: () => context.read<SignUpStoreBloc>().add(
                        SignUpStoreEvent.toggleListView(
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
            ),
          ],
        ),
      ],
    );
  }
}
