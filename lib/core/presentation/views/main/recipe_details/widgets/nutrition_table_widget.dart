import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';

class NutritionTableWidget extends StatelessWidget {
  const NutritionTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.sp),
            topRight: Radius.circular(16.sp),
          ),
          border: Border.all(color: context.colors.nutritionInfoTableGreyColor)),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 5.sp),
              decoration: BoxDecoration(
                color: context.colors.appSecondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.sp),
                  topRight: Radius.circular(16.sp),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      context.strings.calories,
                      style: context.fonts.latoBoldItalic.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      context.strings.carbs,
                      style: context.fonts.latoBoldItalic.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      context.strings.protein,
                      style: context.fonts.latoBoldItalic.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      context.strings.fat,
                      style: context.fonts.latoBoldItalic.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      context.strings.fiber,
                      style: context.fonts.latoBoldItalic.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 5.sp),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      context.strings.kcal_text(330), //todo: change later
                      style: context.fonts.latoBoldItalic.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      context.strings.gram_text(15), //todo: change later
                      style: context.fonts.latoBoldItalic.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      context.strings.gram_text(34), //todo: change later
                      style: context.fonts.latoBoldItalic.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      context.strings.gram_text(4), //todo: change later
                      style: context.fonts.latoBoldItalic.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      context.strings.gram_text(1), //todo: change later
                      style: context.fonts.latoBoldItalic.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
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
