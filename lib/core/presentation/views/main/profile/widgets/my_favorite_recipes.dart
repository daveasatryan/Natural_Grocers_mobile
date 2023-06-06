import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/bottom_nav_enum.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/bloc/profile_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/bloc/profile_event.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/widgets/empty_favorite.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/widgets/sub_title_header.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/recipes/widgets/recipes_grid_view_item.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/recipes/widgets/recipes_list_view_item.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';
import 'package:natural_groceries/core/presentation/widgets/bottom_nav_bar/bloc/bottom_nav_bar_bloc.dart';
import 'package:natural_groceries/core/presentation/widgets/bottom_nav_bar/bloc/bottom_nav_bar_event.dart';

class MyFavoriteRecipes extends StatelessWidget with BaseStatelessMixin {
  const MyFavoriteRecipes({
    super.key,
    required this.favorites,
    required this.viewType,
  });

  final ListViewType viewType;
  final List<int>? favorites;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (favorites.isNotNullOrEmpty())
          SubTitleHeader(
            textButton: viewType == ListViewType.listView
                ? context.strings.grid_view
                : context.strings.list_view,
            text: context.strings.recipes_point_text(600),
            showButton: true,
            onTap: () {
              if (viewType == ListViewType.listView) {
                context.read<ProfileBloc>().add(
                      const ProfileEvent.toggleView(
                        viewType: ListViewType.gridView,
                      ),
                    );
                return;
              }
              context.read<ProfileBloc>().add(
                    const ProfileEvent.toggleView(
                      viewType: ListViewType.listView,
                    ),
                  );
            },
          ),
        SizedBox(height: 15.sp),
        favorites.isNotNullOrEmpty()
            ? viewType == ListViewType.listView
                ? _listView()
                : _gridView()
            : EmptyFavoriteWidget(
                text: context.strings.no_recipes_liked_yet,
                textButton: context.strings.see_recipes,
                onTap: () {
                  context
                      .read<BottomNavBarBloc>()
                      .add(const BottomNavBarEvent.changePage(BottomNavEnum.stores));
                  AppRoutes.goToNested(
                    AppRoutes.recipesRoute,
                    hasBack: false,
                  );
                },
              ),
      ],
    );
  }

  Widget _gridView() {
    return DynamicHeightGridView(
      shrinkWrap: true,
      itemCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      builder: (context, index) {
        return RecipesGridViewItem(
          recipe: null,
          index: index,
          favorites: favorites,
        );
      },
    );
  }

  Widget _listView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return RecipesListViewItem(
          recipe: null,
          index: index,
          favorites: favorites,
        );
      },
    );
  }
}
