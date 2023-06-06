import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/models/articles/article_model.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';

class ArticleDescriptionWidget extends StatelessWidget {
  final ArticleModel? article;

  const ArticleDescriptionWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          article?.title ?? '',
          style: context.fonts.latoBoldItalic.copyWith(
            color: context.colors.orangeColor,
            fontSize: 24.sp,
          ),
        ),
        SizedBox(height: 5.sp),
        Text.rich(
          TextSpan(
            text: context.strings.written_by,
            style: context.fonts.latoLight.copyWith(
              fontSize: 14.sp,
              color: context.colors.black,
            ),
            children: [
              TextSpan(
                text: ' Lindsay Wilson',
                style: context.fonts.latoLight.copyWith(
                  fontSize: 14.sp,
                  color: context.colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: ', ',
                style: context.fonts.latoLight.copyWith(
                  fontSize: 14.sp,
                  color: context.colors.black,
                ),
              ),
              TextSpan(
                text: 'Lissa Beluci',
                style: context.fonts.latoLight.copyWith(
                  fontSize: 14.sp,
                  color: context.colors.black,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10.sp),
        Wrap(
          children: article?.fieldTags?.map((tag) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Chip(
                      label: Text(
                        tag.targetId ?? '',
                        style: context.fonts.latoRegularItalic.copyWith(
                          color: context.colors.blackOpacityColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 3.sp),
                  ],
                );
              }).toList() ??
              [],
        ),
        SizedBox(height: 30.sp),
        AspectRatio(
          aspectRatio: 337 / 240,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.sp),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.mockPicture),
                  ),
                ),
              ),
              Container(
                height: 50.sp,
                decoration: BoxDecoration(
                  color: context.colors.black.withOpacity(.56),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.sp),
                    bottomRight: Radius.circular(16.sp),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 12.sp),
                            padding: EdgeInsets.symmetric(horizontal: 10.sp),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(color: context.colors.whiteColor, width: 2),
                            ),
                            child: Text(
                              '10',
                              style: context.fonts.latoBlack
                                  .copyWith(color: context.colors.whiteColor),
                            ),
                          ),
                          Positioned(
                            right: 55,
                            child: InkWell(
                              child: SvgPicture.asset(
                                AppAssets.starIcon,
                                colorFilter: ColorFilter.mode(
                                  context.colors.orangeColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.sp),
                      child: VerticalDivider(
                        color: context.colors.verticalDividerGreyColor,
                        thickness: 2,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.share_outlined, color: context.colors.whiteColor),
                          SizedBox(width: 8.sp),
                          Text(
                            context.strings.share,
                            style: context.fonts.latoBoldItalic
                                .copyWith(color: context.colors.whiteColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30.sp),
        Html(
          data: '''${article?.body?.value}''',
        ),
        SizedBox(height: 30.sp),
        AspectRatio(
          aspectRatio: 339 / 117,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.sp),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(AppConstants.mockPicture),
              ),
            ),
          ),
        )
      ],
    );
  }
}
