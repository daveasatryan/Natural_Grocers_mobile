import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/recipe_details/widgets/nutrition_table_widget.dart';

class DetailsNutritionInfo extends StatelessWidget {
  const DetailsNutritionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.strings.nutrition_per_serving,
          style: context.fonts.latoBoldItalic.copyWith(fontSize: 14.sp),
        ),
        SizedBox(height: 9.sp),
        const NutritionTableWidget(),
      ],
    );
  }
}
