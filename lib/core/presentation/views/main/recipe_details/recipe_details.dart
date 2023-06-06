import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/models/recipes/recipes_model.dart';
import 'package:natural_groceries/core/data/utilities/helper.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/recipe_details/widgets/details_beverage_pairing_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/recipe_details/widgets/details_description_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/recipe_details/widgets/details_directions_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/recipe_details/widgets/details_ingredients_widget.dart';
import 'package:natural_groceries/core/presentation/views/main/recipe_details/widgets/details_nutrition_info.dart';
import 'package:natural_groceries/core/presentation/views/main/recipe_details/widgets/details_title_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_stepper.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class RecipeDetails extends StatelessWidget with BaseStatelessMixin {
  const RecipeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)?.settings.arguments.nullableCast<RecipesModel>();
    return AppScaffold(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(bottom: 100.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(
                text: context.strings.title_recipe_details,
                textStyle: context.fonts.latoBlackItalic.copyWith(color: context.colors.whiteColor),
                hasBack: true,
                isNested: true,
                height: 97.sp,
              ),
              SizedBox(height: 15.sp),
              CustomStepper(
                physics: const NeverScrollableScrollPhysics(),
                controlsBuilder: (context, controlDetails) => Container(),
                steps: [
                  CustomStep(
                    isActive: true,
                    title: Text(
                      recipe?.title ?? '',
                      style: context.fonts.latoBoldItalic
                          .copyWith(fontSize: 24.sp, color: context.colors.orangeColor),
                    ),
                    content: DetailsTitleWidget(
                      serves: recipe?.fieldServeSizeText ?? '',
                      totalTime: recipe?.fieldRecipeTime,
                      tags: const [
                        'Gluten Free',
                        'Legume Free',
                        'Seed Free',
                        'Primal',
                        'Dairy Free',
                        'Grain Free Diet',
                        'Paleo Diet',
                      ], // todo: change later, this is mock data
                    ),
                  ),
                  CustomStep(
                    title: Text(
                      context.strings.description,
                      style: context.fonts.latoBoldItalic.copyWith(fontSize: 24.sp),
                    ),
                    content: DetailsDescriptionWidget(
                      description: recipe?.body?.value,
                    ),
                  ),
                  CustomStep(
                    title: Text(
                      context.strings.ingredients,
                      style: context.fonts.latoBoldItalic.copyWith(
                        fontSize: 24.sp,
                      ),
                    ),
                    content: const DetailsIngredientsWidget(
                      ingredients: 'ingredients',
                    ),
                  ),
                  CustomStep(
                    title: Text(
                      context.strings.directions,
                      style: context.fonts.latoBoldItalic.copyWith(
                        fontSize: 24.sp,
                      ),
                    ),
                    content: DetailsDirectionsWidget(
                      directions: recipe?.fieldInstructions?.value,
                    ),
                  ),
                  CustomStep(
                      title: Text(
                        context.strings.nutrition_info,
                        style: context.fonts.latoBoldItalic.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      content: const DetailsNutritionInfo()),
                  CustomStep(
                      title: Text(
                        context.strings.beverage_pairing,
                        style: context.fonts.latoBoldItalic.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      content: const DetailsBeveragePairingWidget())
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
