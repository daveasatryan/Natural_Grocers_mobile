import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/data/models/recipes/recipes_model.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/recipes/bloc/recipes_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/recipes/bloc/recipes_event.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/recipes/bloc/recipes_state.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/recipes/widgets/recipes_grid_view_item.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/recipes/widgets/recipes_list_view_item.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_text_filed.dart';

class RecipesWidget extends StatefulWidget {
  const RecipesWidget({super.key});

  @override
  State<RecipesWidget> createState() => _RecipesWidgetState();
}

class _RecipesWidgetState extends State<RecipesWidget> with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          context.read<BlocFactory>().create<RecipesBloc>()..add(const RecipesEvent.getRecipes()),
      child: BlocBuilder<RecipesBloc, RecipesState>(
        builder: (context, state) {
          return state.when(
            loading: () => const CircularProgressIndicator.adaptive(),
            initial: (viewType, favorites) {
              final recipes = context.read<RecipesBloc>().recipes;
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: CustomTextField(
                      hint: context.strings.search,
                      hintStyle: context.fonts.latoMedium
                          .copyWith(color: context.colors.greyShade80, fontSize: 20.sp),
                      labelText: '',
                      fillColor: context.colors.transparent,
                      contentPaddingVertical: 12.sp,
                      borderColor: context.colors.appSecondaryColor,
                      suffixIcon: InkWell(
                        onTap: () async {
                          Map<String, List<String>> result =
                          await AppRoutes.goTo(AppRoutes.recipeFilters);

                          if (mounted) {
                            context
                                .read<BlocFactory>()
                                .create<RecipesBloc>()
                                .add(RecipesEvent.getRecipes(queryMap: result));
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 20.sp),
                          child: Icon(
                            Icons.menu,
                            size: 25.sp,
                            color: context.colors.greyShade80,
                          ),
                        ),
                      ),
                      prefixIcon: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.sp),
                        padding: EdgeInsets.all(7.sp),
                        decoration: BoxDecoration(
                          color: context.colors.mainAppColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.search,
                          color: context.colors.whiteColor,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 13.sp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${recipes.length} ${context.strings.recipes_text}',
                          style: context.fonts.latoRegularItalic.copyWith(
                            fontSize: 24.sp,
                            color: context.colors.whisperBorderColor,
                          ),
                        ),
                        CustomButton(
                          onTap: () {
                            if (viewType == ListViewType.listView) {
                              context.read<RecipesBloc>().add(
                                    const RecipesEvent.toggleView(
                                      viewType: ListViewType.gridView,
                                    ),
                                  );

                              return;
                            }

                            context.read<RecipesBloc>().add(
                                  const RecipesEvent.toggleView(
                                    viewType: ListViewType.listView,
                                  ),
                                );
                          },
                          isColorFilled: true,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 15.sp),
                            child: Text(
                              viewType.title,
                              style: context.fonts.latoBoldItalic.copyWith(
                                  fontSize: 16.sp, color: context.colors.dividerGreyColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 13.sp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: viewType == ListViewType.listView
                        ? _listView(recipes, favorites)
                        : _gridView(recipes, favorites),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _gridView(List<RecipesModel> recipes, List<int>? favorites) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 169 / 252,
        crossAxisCount: 2,
      ),
      shrinkWrap: true,
      itemCount: recipes.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => AppRoutes.goToNested(AppRoutes.recipeDetails, arguments: recipes[index]),
          child: RecipesGridViewItem(
            recipe: recipes[index],
            index: index,
            favorites: favorites,
          ),
        );
      },
    );
  }

  Widget _listView(List<RecipesModel> recipes, List<int>? favorites) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: recipes.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => AppRoutes.goToNested(AppRoutes.recipeDetails, arguments: recipes[index]),
          child: RecipesListViewItem(
            recipe: recipes[index],
            index: index,
            favorites: favorites,
          ),
        );
      },
    );
  }
}
