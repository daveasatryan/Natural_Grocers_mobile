// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/bottom_nav_enum.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/widgets/bottom_nav_bar/bloc/bottom_nav_bar_bloc.dart';
import 'package:natural_groceries/core/presentation/widgets/bottom_nav_bar/bloc/bottom_nav_bar_state.dart';
import 'package:natural_groceries/core/presentation/widgets/bottom_nav_bar/widgets/bottom_nav_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.sp,
      decoration: BoxDecoration(
        color: context.colors.purple,
        borderRadius: BorderRadius.circular(100.sp),
      ),
      margin: EdgeInsets.only(left: 12.sp, right: 12.sp, bottom: 12.sp),
      child: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              BottomNavBarItem(type: BottomNavEnum.dashboard),
              BottomNavBarItem(type: BottomNavEnum.news),
              BottomNavBarItem(type: BottomNavEnum.recipes),
              BottomNavBarItem(type: BottomNavEnum.stores),
            ],
          );
        },
      ),
    );
  }
}
