import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/hotline_magazine_page_enum.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/bloc/hotline_magazine_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/bloc/hotline_magazine_event.dart';

class HotlineMagazineHeader extends StatelessWidget {
  const HotlineMagazineHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            Text(
              '${context.strings.hotline_magazine} | February',
              style: context.fonts.latoMedium.copyWith(
                fontSize: 14.sp,
              ),
            )
          ],
        ),
        IconButton(
          icon: const Icon(Icons.search_rounded),
          onPressed: () {
            context.read<HotlineMagazineBloc>().add(
                  const HotlineMagazineEvent.changePage(
                    page: HotlineMagazinePageEnum.search,
                  ),
                );
          },
        )
      ],
    );
  }
}
