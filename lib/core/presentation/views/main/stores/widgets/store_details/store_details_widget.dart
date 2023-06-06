import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/enums/dialog_icons.dart';
import 'package:natural_groceries/core/data/models/store/store_hours_model.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/data/utilities/helper.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/provider/user_provider.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/bloc/store_details_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/bloc/store_details_event.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/bloc/store_details_state.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/widgets/store_events/store_events_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/widgets/store_promos/store_promos_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/app_network_image.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';

class StoreDetailsWidget extends StatefulWidget {
  final bool isMyPreferredStore;
  final StoreModel? store;

  const StoreDetailsWidget({
    super.key,
    this.store,
    this.isMyPreferredStore = false,
  });

  @override
  State<StoreDetailsWidget> createState() => _StoreDetailsWidgetState();
}

class _StoreDetailsWidgetState extends State<StoreDetailsWidget> with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => context.read<BlocFactory>().create<StoreDetailsBloc>(),
        child: BlocConsumer<StoreDetailsBloc, StoreDetailsState>(
          buildWhen: (prev, cur) => cur.buildWhen(),
          listenWhen: (prev, cur) => cur.listenWhen(),
          listener: (context, state) {
            state.whenOrNull(
              success: (userModel) {
                context.read<UserProvider>().userModel = userModel;
              },
              loading: () => showLoading(),
              error: (msg) => showErrorDialog(msg: msg),
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => Container(),
                initial: () {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 6.sp, left: 12.sp, right: 12.sp),
                        child: Text(
                          widget.store?.fullTitle ?? '',
                          style: context.fonts.latoBoldItalic.copyWith(fontSize: 34.sp),
                        ),
                      ),
                      if (!widget.isMyPreferredStore)
                        Padding(
                          padding: EdgeInsets.only(top: 8.sp, left: 12.sp, right: 12.sp),
                          child: InkWell(
                            onTap: () {
                              showTwoOptionDialog(
                                title: context.strings.set_as_preferred_store_title,
                                msg: context.strings.set_preferred_store_dialog_msg,
                                negativeButtonText: context.strings.no_title,
                                positiveButtonText: context.strings.yes_title,
                                msgPadding: EdgeInsets.symmetric(horizontal: 25.sp),
                                icon: DialogIcons.question,
                                positiveButtonClick: () {
                                  context.read<StoreDetailsBloc>().add(
                                        StoreDetailsEvent.setAsPreferredStore(
                                          widget.store?.nid ?? '',
                                        ),
                                      );
                                },
                              );
                            },
                            child: Text(
                              context.strings.set_as_preferred_store_title,
                              style: context.fonts.latoBold.copyWith(
                                color: context.colors.purple,
                                fontSize: 20.sp,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      SizedBox(height: 30.sp),
                      AspectRatio(
                        aspectRatio: 375 / 133,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: index == 0 ? 12.sp : 5.sp,
                                right: 1 - 1 == index ? 12.sp : 0,
                              ),
                              child: AspectRatio(
                                aspectRatio: 114 / 133,
                                child:
                                    AppNetworkImage(widget.store?.fieldStoreFrontImage?.url ?? ''),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 27.sp),
                      _info(
                        context,
                        icon: AppAssets.icStorePlace,
                        content: Text(
                          widget.store?.address ?? '',
                          style: context.fonts.latoBold.copyWith(
                            fontSize: 16.sp,
                            color: context.colors.orangeBorderColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 18.sp),
                      _info(
                        context,
                        icon: AppAssets.icPhone,
                        content: Text(
                          widget.store?.number ?? '',
                          style: context.fonts.latoBold.copyWith(
                            fontSize: 16.sp,
                            color: context.colors.orangeBorderColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 18.sp),
                      _info(
                        context,
                        icon: AppAssets.icTimer,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        padding: 10.sp,
                        space: 17.sp,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              context.strings.hours_text,
                              style: context.fonts.latoBold.copyWith(fontSize: 16.sp),
                            ),
                            SizedBox(height: 8.sp),
                            ...List.generate(
                                widget.store?.fieldStoreHours?.length ?? 0,
                                (index) => _openTimes(
                                    context, widget.store?.fieldStoreHours?.getOrNull(index))),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.sp),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.sp),
                        child: Text(
                          context.strings.whats_happening_at_store(widget.store?.fullTitle ?? ''),
                          style: context.fonts.latoBold.copyWith(fontSize: 24.sp),
                        ),
                      ),
                      StorePromosWidget(storeId: widget.store?.nid),
                      SizedBox(height: 13.sp),
                      StoreEvents(storeId: widget.store?.nid),
                      SizedBox(height: 8.sp),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              // todo: open web
                            },
                            child: Text(
                              context.strings.view_all_events_on_website,
                              style: context.fonts.latoRegularItalic.copyWith(fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.sp),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.sp),
                        child: Text(
                          context.strings.available_store_services_title,
                          style: context.fonts.latoBold.copyWith(fontSize: 24.sp),
                        ),
                      ),
                      SizedBox(height: 20.sp),
                    ],
                  );
                });
          },
        ));
  }

  Widget _info(
    BuildContext context, {
    required String icon,
    required Widget content,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    double? padding,
    double? space,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Container(
            width: 42.sp,
            height: 42.sp,
            padding: EdgeInsets.all(padding ?? 12.sp),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colors.orangeOpacityColor.withOpacity(.4),
            ),
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                context.colors.orangeBorderColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: space ?? 4.sp),
          Expanded(child: content),
        ],
      ),
    );
  }

  Widget _openTimes(BuildContext context, StoreHoursModel? model) {
    return Padding(
      padding: EdgeInsets.only(top: 4.sp),
      child: Row(
        children: [
          Expanded(
            flex: 109,
            child: Text(
              model?.day?.name ?? '',
              style: context.fonts.latoBold.copyWith(fontSize: 16.sp),
            ),
          ),
          Expanded(
            flex: 193,
            child: Text(
              model?.times ?? '',
              style: context.fonts.latoRegular.copyWith(
                fontSize: 16.sp,
                color: context.colors.whisperBorderColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
