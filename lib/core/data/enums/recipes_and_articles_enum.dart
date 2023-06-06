import 'package:flutter/material.dart';
import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/articles/articles_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/recipes/recipes_widget.dart';

enum RecipesAndArticlesEnum {
  recipes,
  articles;

  static RecipesAndArticlesEnum fromIndex(int index) {
    switch (index) {
      case 0:
        return RecipesAndArticlesEnum.recipes;
      case 1:
        return RecipesAndArticlesEnum.articles;
      default:
        return RecipesAndArticlesEnum.recipes;
    }
  }

  int get getIndex {
    switch (this) {
      case RecipesAndArticlesEnum.recipes:
        return 0;
      case RecipesAndArticlesEnum.articles:
        return 1;
    }
  }

  String get title {
    switch (this) {
      case RecipesAndArticlesEnum.recipes:
        return AppLocale.current.recipes_text;
      case RecipesAndArticlesEnum.articles:
        return AppLocale.current.articles;
    }
  }

  Widget get widget {
    switch (this) {
      case RecipesAndArticlesEnum.recipes:
        return const RecipesWidget();
      case RecipesAndArticlesEnum.articles:
        return const ArticlesWidget();
    }
  }
}
