import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/recipe_filters_enum.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/recipe_filters/widgets/bloc/recipe_filter_widget_bloc.dart';
import 'package:natural_groceries/core/presentation/views/recipe_filters/widgets/bloc/recipe_filter_widget_event.dart';
import 'package:natural_groceries/core/presentation/views/recipe_filters/widgets/recipe_filters_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class RecipeFilters extends StatefulWidget {
  const RecipeFilters({super.key});

  @override
  State<RecipeFilters> createState() => _RecipeFiltersState();
}

class _RecipeFiltersState extends State<RecipeFilters> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<BlocFactory>().create<RecipeFilterWidgetBloc>(),
      child: Builder(
        builder: (context) {
          return AppScaffold(
            child: Scaffold(
              backgroundColor: context.colors.whiteColor,
              bottomNavigationBar: Container(
                padding: EdgeInsets.symmetric(vertical: 35.sp),
                decoration: BoxDecoration(
                  color: context.colors.appSecondaryColor.withOpacity(.43),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.sp),
                    topRight: Radius.circular(60.sp),
                  ),
                ),
                child: FractionallySizedBox(
                  widthFactor: .33,
                  child: CustomButton(
                    isColorFilled: true,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Text(
                        context.strings.apply,
                        textAlign: TextAlign.center,
                        style: context.fonts.latoRegular
                            .copyWith(fontSize: 16.sp, color: context.colors.whiteColor),
                      ),
                    ),
                    onTap: () {
                      AppRoutes.back(result: context.read<RecipeFilterWidgetBloc>().allFiltersMap);
                    },
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HeaderWidget(
                      text: context.strings.recipe_filters,
                      textStyle:
                      context.fonts.latoBlackItalic.copyWith(color: context.colors.whiteColor),
                      height: 97.sp,
                    ),
                    SizedBox(height: 14.sp),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomButton(
                            isColorFilled: false,
                            showBorder: true,
                            onTap: () {
                              context
                                  .read<RecipeFilterWidgetBloc>()
                                  .add(const RecipeFilterWidgetEvent.clearFilters());
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 7.sp, horizontal: 15.sp),
                              child: Text(
                                context.strings.clear_filters,
                                style: context.fonts.latoRegular.copyWith(
                                  fontSize: 18.sp,
                                  color: context.colors.borderTrueColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          Wrap(
                            children: context.watch<RecipeFilterWidgetBloc>().allFilters.map((filter) {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5.sp,
                                      horizontal: 8.sp,
                                    ),
                                    margin: EdgeInsets.only(bottom: 4.sp),
                                    decoration: BoxDecoration(
                                      color: context.colors.chipColor,
                                      borderRadius: BorderRadius.circular(17.sp),
                                    ),
                                    child: Text(
                                      filter.name ?? '',
                                      style: context.fonts.latoRegular.copyWith(
                                        color: context.colors.blackOpacityColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 2.sp),
                                ],
                              );
                            }).toList(),
                          ),
                          Divider(
                            color: context.colors.dividerGreyColor,
                            thickness: 3,
                          ),
                          SizedBox(height: 14.sp),
                          ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => SizedBox(height: 10.sp),
                            itemCount: RecipeFiltersEnum.values.length,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return RecipeFilterWidget(
                                filtersListsEnum: RecipeFiltersEnum.values[index],
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
