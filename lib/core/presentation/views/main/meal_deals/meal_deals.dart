import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/meal_deals/bloc/meal_deals_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/meal_deals/bloc/meal_deals_event.dart';
import 'package:natural_groceries/core/presentation/views/main/meal_deals/bloc/meal_deals_state.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class MealDeals extends StatelessWidget {
  const MealDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: BlocProvider(
        create: (context) => context.read<BlocFactory>().create<MealDealsBloc>(),
        child: BlocBuilder<MealDealsBloc, MealDealsState>(
          builder: (context, state) {
            return state.when(
              initial: (view) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderWidget(
                        text: context.strings.meal_deals_title,
                        textStyle: context.fonts.latoBlackItalic
                            .copyWith(color: context.colors.whiteColor),
                        isNested: true,
                        height: 97.sp,
                      ),
                      SizedBox(height: 16.sp),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomButton(
                              onTap: () {
                                if (view == ListViewType.listView) {
                                  context.read<MealDealsBloc>().add(
                                        const MealDealsEvent.changeView(
                                          view: ListViewType.gridView,
                                        ),
                                      );

                                  return;
                                }

                                context.read<MealDealsBloc>().add(
                                      const MealDealsEvent.changeView(
                                        view: ListViewType.listView,
                                      ),
                                    );
                              },
                              isColorFilled: true,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 15.sp),
                                child: Text(
                                  view.title,
                                  style: context.fonts.latoBoldItalic.copyWith(
                                      fontSize: 16.sp, color: context.colors.dividerGreyColor),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.sp),
                            if (view == ListViewType.listView) _listView(),
                            if (view == ListViewType.gridView) _gridView(),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _gridView() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.sp,
        mainAxisSpacing: 17.sp,
      ),
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.sp), topLeft: Radius.circular(16.sp)),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstants.mockPicture),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 15.sp,
                    left: 14.sp,
                    right: 14.sp,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Grill', style: context.fonts.latoBoldItalic.copyWith(fontSize: 16.sp)),
                      SizedBox(height: 5.sp),
                      Text(
                        context.strings.expires('12/02/2023'),
                        style: context.fonts.latoBoldItalic.copyWith(
                          fontSize: 14.sp,
                          color: context.colors.whisperBorderColor,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _listView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 339 / 117,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.sp), topLeft: Radius.circular(16.sp)),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstants.mockPicture),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15.sp,
                  left: 14.sp,
                  bottom: 10.sp,
                  right: 14.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Grill', style: context.fonts.latoBoldItalic.copyWith(fontSize: 16.sp)),
                    SizedBox(height: 5.sp),
                    Text(
                      context.strings.expires('12/02/2023'),
                      style: context.fonts.latoBoldItalic.copyWith(
                        fontSize: 14.sp,
                        color: context.colors.whisperBorderColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
