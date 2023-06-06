import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/enums/hotline_magazine_page_enum.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/bloc/hotline_magazine_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/bloc/hotline_magazine_event.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_text_filed.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                color: context.colors.greyColor,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left_rounded, size: 30.sp),
                onPressed: () {
                  context.read<HotlineMagazineBloc>().add(
                        const HotlineMagazineEvent.changePage(
                          page: HotlineMagazinePageEnum.slideView,
                        ),
                      );
                },
              ),
              Text(
                context.strings.search,
                style: context.fonts.latoMedium,
              ),
              Container(width: 30.sp),
            ],
          ),
        ),
        SizedBox(height: 10.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: CustomTextField(
                  labelText: '',
                  hint: context.strings.enter_text_here,
                  cursorColor: context.colors.blueShadeColor,
                  fillColor: context.colors.transparent,
                  prefixIcon: Icon(
                    Icons.search,
                    color: context.colors.black,
                  ),
                ),
              ),
              SizedBox(width: 5.sp),
              SvgPicture.asset(
                AppAssets.settings,
                height: 30.sp,
                width: 30.sp,
                colorFilter: ColorFilter.mode(context.colors.greyColor, BlendMode.srcIn),
              ),
            ],
          ),
        )
      ],
    );
  }
}
