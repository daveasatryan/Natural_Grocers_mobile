import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/widgets/empty_favorite.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/widgets/sub_title_header.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/articles/widgets/articles_grid_view_item.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/articles/widgets/articles_list_view_item.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class MyFavoriteArticles extends StatelessWidget with BaseStatelessMixin {
  const MyFavoriteArticles({
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
            text: context.strings.articles_point_text(1),
          ),
        SizedBox(height: 15.sp),
        favorites.isNotNullOrEmpty()
            ? viewType == ListViewType.listView
                ? _listView()
                : _gridView()
            : EmptyFavoriteWidget(
                text: context.strings.no_articles_liked_yet,
                textButton: context.strings.see_articles,
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
        return ArticlesGridViewItem(
          article: null,
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
        return ArticlesListViewItem(
          article: null,
          index: index,
          favorites: favorites,
        );
      },
    );
  }
}
