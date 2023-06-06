import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/recipes_and_articles_enum.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/bloc/recipes_and_articles_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/bloc/recipes_and_articles_event.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/bloc/recipes_and_articles_state.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/tab_bar_indicator.dart';

class RecipesAndArticles extends StatefulWidget {
  const RecipesAndArticles({super.key});

  @override
  State<RecipesAndArticles> createState() => _RecipesAndArticlesState();
}

class _RecipesAndArticlesState extends State<RecipesAndArticles>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
      animationDuration: const Duration(milliseconds: 100),
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        backgroundColor: context.colors.whiteColor,
        body: BlocProvider(
          create: (context) => context.read<BlocFactory>().create<RecipesAndArticlesBloc>(),
          child: BlocBuilder<RecipesAndArticlesBloc, RecipesAndArticlesState>(
            builder: (context, state) {
              return state.when(
                initial: (tab) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        HeaderWidget(
                          text: context.strings.find_recipes_and_articles,
                          textStyle: context.fonts.latoBlackItalic
                              .copyWith(color: context.colors.whiteColor),
                          hasBack: false,
                          height: 97.sp,
                        ),
                        SizedBox(height: 6.sp),
                        TabBar(
                          controller: _tabController,
                          labelColor: context.colors.blackOpacityColor,
                          unselectedLabelColor: context.colors.tabGreyColor,
                          unselectedLabelStyle: context.fonts.latoMediumItalic
                              .copyWith(color: context.colors.tabGreyColor, fontSize: 24.sp),
                          labelStyle: context.fonts.latoBoldItalic.copyWith(fontSize: 24.sp),
                          indicator: MyTabBarIndicator(
                            bottomLeftRadius: 100.sp,
                            bottomRightRadius: 100.sp,
                            topLeftRadius: 100.sp,
                            topRightRadius: 100.sp,
                            indicatorWidth: 40.sp,
                            horizontalPadding: 40.sp,
                            color: context.colors.tabIndicatorColor,
                            paintingStyle: PaintingStyle.fill,
                          ),
                          onTap: (index) {
                            context.read<RecipesAndArticlesBloc>().add(
                                  RecipesAndArticlesEvent.changeTab(
                                    RecipesAndArticlesEnum.fromIndex(index),
                                  ),
                                );
                          },
                          tabs: RecipesAndArticlesEnum.values
                              .map(
                                (e) => Tab(
                                  child: Text(e.title),
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: 15.sp),
                        tab.widget,
                      ],
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
}
