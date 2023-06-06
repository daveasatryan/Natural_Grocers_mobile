import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/enums/bottom_nav_enum.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/bottom_nav_bar/bloc/bottom_nav_bar_bloc.dart';
import 'package:natural_groceries/core/presentation/widgets/bottom_nav_bar/bloc/bottom_nav_bar_event.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.type,
  });

  final BottomNavEnum type;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<BottomNavBarBloc>().add(
              BottomNavBarEvent.changePage(type),
            );
        AppRoutes.goToNested(type.page, hasBack: false);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            type.svgIcon,
            width: 36.sp,
            height: 36.sp,
            colorFilter: ColorFilter.mode(
              context.read<BottomNavBarBloc>().isPageSelected(type)
                  ? Colors.white
                  : Colors.white.withOpacity(.6),
              BlendMode.srcIn,
            ),
          ),
          Text(
            type.title,
            style: context.fonts.latoRegular.copyWith(
              color: context.read<BottomNavBarBloc>().isPageSelected(type)
                  ? Colors.white
                  : Colors.white.withOpacity(.6),
            ),
          ),
        ],
      ),
    );
  }
}
