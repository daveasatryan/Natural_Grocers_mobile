import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/dashboard/widget/vitamins_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/more_ways_to_save/bloc/more_ways_to_save_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/more_ways_to_save/bloc/more_ways_to_save_event.dart';
import 'package:natural_groceries/core/presentation/views/main/more_ways_to_save/bloc/more_ways_to_save_state.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreWaysToSave extends StatefulWidget {
  const MoreWaysToSave({super.key});

  @override
  State<MoreWaysToSave> createState() => _MoreWaysToSaveState();
}

class _MoreWaysToSaveState extends State<MoreWaysToSave> with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: BlocProvider(
      create: (context) => context.read<BlocFactory>().create<MoreWaysToSaveBloc>()
        ..add(const MoreWaysToSaveEvent.getMoreWaysToSave()),
      child: BlocConsumer<MoreWaysToSaveBloc, MoreWaysToSaveState>(
        buildWhen: (prev, cur) => cur.buildWhen(),
        listenWhen: (prev, cur) => cur.listenWhen(),
        listener: (context, state) {
          state.whenOrNull(
            loading: () => showLoading(),
            error: (msg) => showErrorDialog(msg: msg),
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            success: (moreWaysToSaveList) {
              hideLoading();
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 60.sp),
                  child: Column(
                    children: [
                      HeaderWidget(
                        text: context.strings.more_ways_to_save,
                        textStyle: context.fonts.latoBlackItalic
                            .copyWith(color: context.colors.whiteColor),
                        isNested: true,
                        height: 97.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 40.sp, horizontal: 20.sp),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () => AppRoutes.goToNested(AppRoutes.bingoOptions),
                              child: Container(
                                padding: EdgeInsets.only(bottom: 10.sp),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: context.colors.profileBorder,
                                      blurRadius: 4,
                                      offset: const Offset(1, 6),
                                    ),
                                    BoxShadow(
                                      color: context.colors.profileBorder,
                                      blurRadius: 4,
                                      offset: const Offset(1, 6),
                                    ),
                                  ],
                                  color: context.colors.whiteColor,
                                  borderRadius: BorderRadius.circular(24.sp),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 20.sp),
                                      decoration: BoxDecoration(
                                        color: context.colors.borderTrueColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(24.sp),
                                          topRight: Radius.circular(24.sp),
                                        ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Divider(
                                              color: context.colors.whiteColor.withOpacity(0.4),
                                              height: 0.5.sp,
                                            ),
                                          ),
                                          Text(
                                            context.strings.bingo('{N}'),
                                            style: context.fonts.latoBlack.copyWith(
                                              fontSize: 35.sp,
                                              color: context.colors.whiteColor,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          Expanded(
                                            child: Divider(
                                              color: context.colors.whiteColor.withOpacity(0.4),
                                              height: 0.5.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(13.sp),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 3,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    RewardWidget(
                                                      color: context.colors.redShadeColor,
                                                      word: 'B',
                                                    ),
                                                    SizedBox(width: 6.sp),
                                                    RewardWidget(
                                                      color: context.colors.orangeShadeColor,
                                                      word: 'I',
                                                    ),
                                                    SizedBox(width: 6.sp),
                                                    RewardWidget(
                                                      color: context.colors.blueShadeColor,
                                                      word: '{N}',
                                                    ),
                                                    SizedBox(width: 6.sp),
                                                    RewardWidget(
                                                      color: context.colors.purpleShadeColor,
                                                      word: 'G',
                                                    ),
                                                    SizedBox(width: 6.sp),
                                                    RewardWidget(
                                                      color: context.colors.greenShadeColor,
                                                      word: 'O',
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  context.strings.complete_any_one_tine_To,
                                                  maxLines: 2,
                                                  style: context.fonts.latoRegularItalic.copyWith(
                                                    color: context.colors.whisperOpacityColor,
                                                    fontSize: 16.sp,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: SizedBox(
                                              child:
                                                  Image.asset(AppAssets.naturalGroceriesBankImage),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16.sp),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: moreWaysToSaveList.length,
                              separatorBuilder: (context, index) => SizedBox(height: 16.sp),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => AppRoutes.goToNested(AppRoutes.hotlineMagazine),
                                  child: AspectRatio(
                                    aspectRatio: 339 / 180,
                                    child: InkWell(
                                      onTap: () {
                                        if (moreWaysToSaveList[index].clickUrl.isNotNullOrEmpty()) {
                                          launchUrl(
                                              Uri.parse(moreWaysToSaveList[index].clickUrl ?? ''),
                                              mode: LaunchMode.externalApplication);
                                        }
                                      },
                                      child: CachedNetworkImage(
                                        imageUrl: moreWaysToSaveList[index].imageUrl ?? '',
                                        imageBuilder: (context, imageProvider) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(16.sp),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
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
              );
            },
          );
        },
      ),
    ));
  }
}
