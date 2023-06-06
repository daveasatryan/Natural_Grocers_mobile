import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/models/articles/article_model.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';

class ArticleRecommendedInfoWidget extends StatelessWidget {
  final ArticleModel? article;

  const ArticleRecommendedInfoWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nature’s original antibiotic', // todo: change
          style: context.fonts.latoBoldItalic.copyWith(
            fontSize: 20.sp,
          ),
        ),
        SizedBox(height: 10.sp),
        Padding(
          padding: EdgeInsets.only(left: 10.sp),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 4.sp),
                    height: 11.sp,
                    width: 11.sp,
                    decoration:
                        BoxDecoration(color: context.colors.orangeColor, shape: BoxShape.circle),
                  ),
                  SizedBox(width: 13.sp),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recommended Info', //todo: change
                          style: context.fonts.latoBold.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 5.sp),
                        Text(
                          //todo: change
                          'Non-animal-sourced enzymes can be derived from plants, fungi, or bacteria. Aspergillus is a fungus that enzymes are commonly harvested from since it can produce different types of enzymes simply by manipulating its food or strain.',
                          style: context.fonts.latoRegular.copyWith(
                            fontSize: 14.sp,
                            overflow: TextOverflow.visible,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 17.sp),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 4.sp),
                    height: 11.sp,
                    width: 11.sp,
                    decoration:
                        BoxDecoration(color: context.colors.orangeColor, shape: BoxShape.circle),
                  ),
                  SizedBox(width: 13.sp),
                  Flexible(
                    child: Text(
                      //todo: change
                      'Food-based enzymes come directly from food. All raw food contains the enzymes that would be necessary to breakdown that particular food.',
                      style: context.fonts.latoRegular.copyWith(
                        fontSize: 14.sp,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
