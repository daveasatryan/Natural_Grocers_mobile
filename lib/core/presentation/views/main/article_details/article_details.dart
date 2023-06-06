import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/models/articles/article_model.dart';
import 'package:natural_groceries/core/data/utilities/helper.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/article_details/widgets/article_description_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/article_details/widgets/article_recommended_info_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/article_details/widgets/article_sources_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)?.settings.arguments.nullableCast<ArticleModel>();
    return AppScaffold(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(bottom: 100.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(
                  text: context.strings.title_article_details,
                  textStyle:
                      context.fonts.latoBlackItalic.copyWith(color: context.colors.whiteColor),
                  hasBack: true,
                  isNested: true,
                  height: 97.sp,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.sp, horizontal: 25.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ArticleDescriptionWidget(article: article),
                      SizedBox(height: 36.sp),
                      ArticleRecommendedInfoWidget(article: article),
                      SizedBox(height: 17.sp),
                      ArticleSourcesWidget(article: article),
                      SizedBox(height: 30.sp),
                      Text(
                        context.strings.article_details_info,
                        style: context.fonts.latoRegular.copyWith(fontSize: 12.sp),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
