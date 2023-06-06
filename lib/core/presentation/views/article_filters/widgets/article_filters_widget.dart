import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/enums/article_filters_enum.dart';
import 'package:natural_groceries/core/data/enums/recipe_filter_options_view_enum.dart';
import 'package:natural_groceries/core/data/models/filters/filters_model.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/article_filters/widgets/bloc/article_filter_widget_bloc.dart';
import 'package:natural_groceries/core/presentation/views/article_filters/widgets/bloc/article_filter_widget_event.dart';
import 'package:natural_groceries/core/presentation/views/article_filters/widgets/bloc/article_filter_widget_state.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';

class ArticleFilterWidget extends StatefulWidget {
  final ArticleFiltersEnum filtersListsEnum;

  const ArticleFilterWidget({
    super.key,
    required this.filtersListsEnum,
  });

  @override
  State<ArticleFilterWidget> createState() => _ArticleFilterWidgetState();
}

class _ArticleFilterWidgetState extends State<ArticleFilterWidget> with BaseStateMixin {
  ExpandedTileController expandedTileController = ExpandedTileController();

  bool get isExpanded => expandedTileController.isExpanded;

  Map<ArticleFiltersEnum, List<FiltersModel>> get multipleSelectedFilters =>
      context.watch<ArticleFilterWidgetBloc>().multipleSelectedFilters;

  Map<ArticleFiltersEnum, FiltersModel> get singleSelectedFilters =>
      context.watch<ArticleFilterWidgetBloc>().singleSelectedFilters;

  @override
  void dispose() {
    expandedTileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandedTile(
      onTap: () {
        context.read<ArticleFilterWidgetBloc>().add(
              ArticleFilterWidgetEvent.getFilters(widget.filtersListsEnum),
            );
      },
      theme: ExpandedTileThemeData(
        headerColor: singleSelectedFilters.keys.contains(widget.filtersListsEnum) ||
                multipleSelectedFilters.keys.contains(widget.filtersListsEnum)
            ? context.colors.greenScreenColor
            : context.colors.dividerColor.withOpacity(.23),
        headerRadius: 24.0,
        headerPadding: EdgeInsets.symmetric(vertical: 7.sp, horizontal: 5.sp),
        headerSplashColor: context.colors.transparent,
        contentBackgroundColor: context.colors.transparent,
        contentPadding: EdgeInsets.zero,
      ),
      title: Text(
        widget.filtersListsEnum.title,
        style: context.fonts.latoRegularItalic.copyWith(
          fontSize: 16.sp,
          color: singleSelectedFilters.keys.contains(widget.filtersListsEnum) ||
                  multipleSelectedFilters.keys.contains(widget.filtersListsEnum)
              ? context.colors.whiteColor
              : context.colors.whisperBorderColor,
        ),
      ),
      controller: expandedTileController,
      trailing: SvgPicture.asset(
        AppAssets.arrowDown,
        colorFilter: ColorFilter.mode(
          singleSelectedFilters.keys.contains(widget.filtersListsEnum) ||
                  multipleSelectedFilters.keys.contains(widget.filtersListsEnum)
              ? context.colors.whiteColor
              : context.colors.whisperBorderColor,
          BlendMode.srcIn,
        ),
      ),
      trailingRotation: 180,
      expansionDuration: const Duration(milliseconds: 150),
      content: BlocConsumer<ArticleFilterWidgetBloc, ArticleFilterWidgetState>(
        buildWhen: (prev, cur) =>
            cur.buildWhen() &&
            widget.filtersListsEnum == context.read<ArticleFilterWidgetBloc>().currentExpandedFilter,
        listenWhen: (prev, cur) => cur.listenWhen(),
        listener: (context, state) {
          state.whenOrNull(error: (msg) => showErrorDialog(msg: msg));
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            loading: () => const Center(child: CupertinoActivityIndicator()),
            success: (filtersMap) {
              return Column(
                children: filtersMap[widget.filtersListsEnum]?.map(
                      (filter) {
                        if (widget.filtersListsEnum.viewType == FilterOptionsViewType.radio) {
                          return ListTile(
                            dense: true,
                            onTap: () {
                              if (!(context
                                  .read<ArticleFilterWidgetBloc>()
                                  .singleSelectedFilters
                                  .containsValue(filter))) {
                                context.read<ArticleFilterWidgetBloc>().add(
                                      ArticleFilterWidgetEvent.selectFilter(
                                        filter,
                                        widget.filtersListsEnum,
                                        FilterOptionsViewType.radio,
                                      ),
                                    );
                              }
                            },
                            title: Text(filter.name ?? '', style: fonts.latoRegular),
                            minLeadingWidth: 0.sp,
                            leading: Container(
                              width: 23.sp,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.sp,
                                  color: colors.whisperBorderColor,
                                ),
                                color: singleSelectedFilters.values.contains(filter)
                                    ? colors.greenScreenColor
                                    : colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(5.sp),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: colors.whiteColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1.sp,
                                    color: singleSelectedFilters.values.contains(filter)
                                        ? colors.whisperBorderColor
                                        : colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return ListTile(
                            dense: true,
                            onTap: () {
                              context.read<ArticleFilterWidgetBloc>().add(
                                    ArticleFilterWidgetEvent.selectFilter(
                                      filter,
                                      widget.filtersListsEnum,
                                      FilterOptionsViewType.checkbox,
                                    ),
                                  );
                            },
                            title: Text(filter.name ?? '', style: context.fonts.latoRegular),
                            minLeadingWidth: 0.sp,
                            leading: Container(
                              height: 23.sp,
                              width: 23.sp,
                              padding: EdgeInsets.all(2.sp),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.sp,
                                  color: context.colors.whisperBorderColor,
                                ),
                                borderRadius: BorderRadius.circular(6.sp),
                                color: multipleSelectedFilters[widget.filtersListsEnum]
                                            ?.contains(filter) ==
                                        true
                                    ? context.colors.greenScreenColor
                                    : context.colors.transparent,
                                shape: BoxShape.rectangle,
                              ),
                              child: multipleSelectedFilters.values
                                      .map((e) => e.contains(filter))
                                      .toList()
                                      .isNotNullOrEmpty()
                                  ? SvgPicture.asset(AppAssets.checkIcon)
                                  : null,
                            ),
                          );
                        }
                      },
                    ).toList() ??
                    [],
              );
            },
          );
        },
      ),
    );
  }
}
