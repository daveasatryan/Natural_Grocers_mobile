import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/hotline_magazine_page_enum.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/bloc/hotline_magazine_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/bloc/hotline_magazine_event.dart';
import 'package:natural_groceries/core/presentation/widgets/app_loading.dart';

class Thumbnails extends StatelessWidget {
  const Thumbnails({super.key});

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
              Container(width: 30.sp),
              Text(
                context.strings.thumbnails,
                style: context.fonts.latoMedium,
              ),
              IconButton(
                icon: Icon(Icons.chevron_right_rounded, size: 30.sp),
                onPressed: () {
                  context.read<HotlineMagazineBloc>().add(
                        const HotlineMagazineEvent.changePage(
                          page: HotlineMagazinePageEnum.tableOfContents,
                        ),
                      );
                },
              )
            ],
          ),
        ),
        SizedBox(height: 10.sp),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 10,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context.read<HotlineMagazineBloc>().add(
                      HotlineMagazineEvent.changePage(
                        page: HotlineMagazinePageEnum.slideView,
                        index: index,
                      ),
                    );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                      imageUrl: AppConstants.mockPicture,
                      imageBuilder: (context, imageProvider) => Container(
                            height: 100.sp,
                            width: 100.sp,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      placeholder: (context, url) => const AppLoadingWidget()),
                  SizedBox(height: 5.sp),
                  Text(
                    (index + 1).toString(),
                    style: context.fonts.latoLight.copyWith(
                      color: context.colors.black,
                      fontSize: 14.sp,
                    ),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
