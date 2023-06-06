import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/models/articles/article_model.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';

class ArticleSourcesWidget extends StatelessWidget {
  final ArticleModel? article;

  const ArticleSourcesWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.strings.for_the_love_of_examples,
          style: context.fonts.latoBoldItalic.copyWith(
            fontSize: 20.sp,
            color: context.colors.orangeColor,
          ),
        ),
        SizedBox(height: 4.sp),
        Text(
          'Nature’s original antibiotic',
          style: context.fonts.latoSemiBoldItalic.copyWith(
            fontSize: 20.sp,
          ),
        ),
        SizedBox(height: 4.sp),
        Text(
          '${context.strings.total_time}: 10 hours', //todo: change
          style: context.fonts.latoRegularItalic.copyWith(fontSize: 16.sp),
        ),
        SizedBox(height: 4.sp),
        Text(
          '${context.strings.recommended_wine}: Pinochet', //todo: change
          style: context.fonts.latoBold.copyWith(fontSize: 14.sp),
        ),
        SizedBox(height: 4.sp),
        Text(
          context.strings.disclaimer_and_other_info,
          style: context.fonts.latoRegular.copyWith(fontSize: 12.sp),
        ),
        SizedBox(height: 17.sp),
        Text(
          context.strings.sources,
          style: context.fonts.latoBoldItalic.copyWith(
            fontSize: 20.sp,
          ),
        ),
        SizedBox(height: 20.sp),
        Padding(
          padding: EdgeInsets.only(left: 10.sp),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 25.sp,
                    width: 25.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colors.orangeColor,
                    ),
                    child: Center(
                      child: Text(
                        '1',
                        style: context.fonts.latoBold.copyWith(
                          color: context.colors.whiteColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.sp),
                  Flexible(
                    child: Text(
                      //todo: change
                      'In 1858, Louis Pasteur wrote that garlic killed bacteria, but he only confirmed what thousands of years of history already knew. Garlic’s use as a medicine goes back to the time of the ancient Sumerians (2600-2100 BC) and was an invaluable medicine for nearly every ancient civilization from China, India, and Tibet to Egypt, Rome, and Greece',
                      style: context.fonts.latoRegular.copyWith(fontSize: 14.sp),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.sp),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 25.sp,
                    width: 25.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colors.orangeColor,
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: context.fonts.latoBold.copyWith(
                          color: context.colors.whiteColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.sp),
                  Flexible(
                    child: Text(
                      //todo: change
                      'It is purported that 18th century French gravediggers drank wine mixed with crushed garlic to protect themselves from the plague and garlic is said to have saved a thousand citizens in Marseille from the spread of plague. In the pre-antibiotic era of WWI, garlic paste was used in the battlefields as a wound dressing for injured soldiers.',
                      style: context.fonts.latoRegular.copyWith(fontSize: 14.sp),
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
