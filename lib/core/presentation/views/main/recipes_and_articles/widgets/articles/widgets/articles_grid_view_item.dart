import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/models/articles/article_model.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/articles/bloc/articles_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/recipes_and_articles/widgets/articles/bloc/articles_event.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class ArticlesGridViewItem extends StatelessWidget with BaseStatelessMixin {
  const ArticlesGridViewItem({
    super.key,
    required this.article,
    required this.index,
    required this.favorites,
  });

  final ArticleModel? article;
  final int index;
  final List<int>? favorites;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.sp),
                  topLeft: Radius.circular(16.sp),
                ),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.mockPicture),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article?.title ?? '',
                    maxLines: 1,
                    style: context.fonts.latoRegularItalic.copyWith(
                      fontSize: 16.sp,
                      color: context.colors.orangeColor,
                      overflow: TextOverflow.ellipsis,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(height: 5.sp),
                  Text(
                    article?.title ?? '',
                    maxLines: 3,
                    style: context.fonts.latoBoldItalic.copyWith(
                      fontSize: 16.sp,
                      color: context.colors.blackOpacityColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 7.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.strings.minutes('30'),
                        style: context.fonts.latoBoldItalic
                            .copyWith(color: context.colors.mainAppColor),
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 12.sp),
                            padding: EdgeInsets.symmetric(horizontal: 10.sp),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(color: context.colors.mainAppColor, width: 2),
                            ),
                            child: Text(
                              '10',
                              style: context.fonts.latoBlack
                                  .copyWith(color: context.colors.mainAppColor),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                if (favorites?.contains(index) == true) {
                                  showTwoOptionDialog(
                                    context,
                                    msg: context.strings.unfavorite_msg,
                                    msgStyle: context.fonts.latoRegularItalic.copyWith(
                                      fontSize: 18.sp,
                                    ),
                                    title: context.strings.are_you_sure,
                                    titleStyle: context.fonts.latoBoldItalic.copyWith(
                                      fontSize: 24.sp,
                                    ),
                                    showHeaderIcon: false,
                                    positiveButtonText: context.strings.yes_remove,
                                    positiveButtonClick: () {
                                      context.read<ArticlesBloc>().add(
                                            ArticlesEvent.addToFavorites(
                                              itemId: index,
                                            ),
                                          );
                                    },
                                    negativeButtonText: context.strings.cancel,
                                  );
                                } else {
                                  context.read<ArticlesBloc>().add(
                                        ArticlesEvent.addToFavorites(
                                          itemId: index,
                                        ),
                                      );
                                }
                              },
                              child: SvgPicture.asset(
                                AppAssets.starIcon,
                                colorFilter: favorites?.contains(index) == true
                                    ? ColorFilter.mode(
                                        context.colors.orangeColor,
                                        BlendMode.srcIn,
                                      )
                                    : null,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
