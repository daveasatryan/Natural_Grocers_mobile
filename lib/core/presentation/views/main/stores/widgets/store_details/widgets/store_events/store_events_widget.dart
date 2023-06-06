import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/models/store/store_event_model.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/widgets/store_events/bloc/store_events_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/widgets/store_events/bloc/store_events_event.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/widgets/store_events/bloc/store_events_state.dart';
import 'package:natural_groceries/core/presentation/widgets/app_loading.dart';

class StoreEvents extends StatelessWidget {
  const StoreEvents({
    super.key,
    this.storeId,
  });

  final String? storeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<BlocFactory>().create<StoreEventsBloc>()
        ..add(StoreEventsEvent.getEvents(storeId)),
      child: AspectRatio(
        aspectRatio: 375 / 168,
        child: BlocBuilder<StoreEventsBloc, StoreEventsState>(
          builder: (context, state) => state.when(
            loading: () => const AppLoadingWidget(),
            error: (msg) => Center(
              child: Text(
                msg,
                style: context.fonts.latoMediumItalic,
              ),
            ),
            success: (data) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                final model = data[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 12.sp : 5.sp,
                    right: data.length - 1 == index ? 12.sp : 0, // todo
                  ),
                  child: AspectRatio(
                    aspectRatio: 332 / 168,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        color: context.colors.textLightColor,
                        boxShadow: [
                          BoxShadow(
                            color: context.colors.shadowColor,
                            blurRadius: 4,
                            offset: const Offset(-2, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 21.sp),
                            decoration: BoxDecoration(
                                color: context.colors.purple,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(12.sp))),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                model.title ?? '',
                                style: context.fonts.latoBold.copyWith(
                                  color: context.colors.textLightColor,
                                  fontSize: 16.sp,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(7.sp),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 9.sp),
                                    padding: EdgeInsets.all(4.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.sp),
                                      color: context.colors.whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: context.colors.shadowColor,
                                          blurRadius: 4,
                                          offset: const Offset(-2, 4),
                                        ),
                                      ],
                                    ),
                                    child: AspectRatio(
                                      aspectRatio: 71 / 110,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            model.month,
                                            style:
                                                context.fonts.latoBlack.copyWith(fontSize: 16.sp),
                                          ),
                                          SizedBox(height: 4.sp),
                                          Text(
                                            model.day,
                                            style: context.fonts.latoBlack.copyWith(
                                              fontSize: 24.sp,
                                              color: context.colors.purple,
                                            ),
                                          ),
                                          SizedBox(height: 4.sp),
                                          Text(
                                            model.weekDay,
                                            style: context.fonts.latoRegular.copyWith(
                                                fontSize: 12.sp, overflow: TextOverflow.ellipsis),
                                            maxLines: 1,
                                          ),
                                          SizedBox(height: 4.sp),
                                          Text(
                                            model.time,
                                            style: context.fonts.latoRegular.copyWith(
                                                fontSize: 12.sp, overflow: TextOverflow.ellipsis),
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          model.subtitle ?? '',
                                          style: context.fonts.latoRegular.copyWith(
                                            fontSize: 14.sp,
                                            color: context.colors.whisperColor,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 2,
                                        ),
                                        SizedBox(height: 4.sp),
                                        Text(
                                          'Event Name', // todo: dont know what to set
                                          style: context.fonts.latoRegular.copyWith(
                                            fontSize: 12.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 1,
                                        ),
                                        SizedBox(height: 8.sp),
                                        Text(
                                          context.strings.title_presented_by,
                                          style: context.fonts.latoBold.copyWith(
                                            fontSize: 12.sp,
                                            color: context.colors.whisperColor,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 1,
                                        ),
                                        SizedBox(height: 2.sp),
                                        Text(
                                          model.presenterName ?? '',
                                          style: context.fonts.latoMedium.copyWith(
                                            fontSize: 12.sp,
                                            color: context.colors.whisperColor,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 12.sp),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
