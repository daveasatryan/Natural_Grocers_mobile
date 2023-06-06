import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/hotline_magazine_page_enum.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/bloc/hotline_magazine_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/bloc/hotline_magazine_event.dart';
import 'package:natural_groceries/core/presentation/widgets/app_loading.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';

class HotlineMagazineFooter extends StatefulWidget {
  final int imageIndex;

  const HotlineMagazineFooter({
    super.key,
    required this.imageIndex,
  });

  @override
  State<HotlineMagazineFooter> createState() => _HotlineMagazineFooterState();
}

class _HotlineMagazineFooterState extends State<HotlineMagazineFooter> with BaseStateMixin {
  CarouselController? _carouselController;

  int get imageIndex => widget.imageIndex;

  @override
  void initState() {
    _carouselController = CarouselController();
    super.initState();
  }

  @override
  void dispose() {
    _carouselController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          options: CarouselOptions(
            aspectRatio: 1 / 1,
            viewportFraction: 1,
            initialPage: imageIndex,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (value, reason) {
              context.read<HotlineMagazineBloc>().add(
                    HotlineMagazineEvent.changePhoto(index: value),
                  );
            },
          ),
          itemCount: 10,
          itemBuilder: (context, index, pageViewIndex) {
            return CachedNetworkImage(
                imageUrl: AppConstants.mockPicture,
                imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                placeholder: (context, url) => const AppLoadingWidget());
          },
        ),
        SizedBox(height: 20.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  context.read<HotlineMagazineBloc>().add(
                        const HotlineMagazineEvent.changePage(
                          page: HotlineMagazinePageEnum.thumbnails,
                        ),
                      );
                },
                child: Row(
                  children: [
                    Icon(Icons.grid_view_sharp, color: context.colors.greyColor),
                    SizedBox(width: 5.sp),
                    Text(
                      '${imageIndex + 1}/10',
                      style: context.fonts.latoMedium.copyWith(
                        color: context.colors.greyColor,
                      ),
                    )
                  ],
                ),
              ),
              Image.asset(AppAssets.logoDashboardAppBarIcon, height: 49.sp, width: 208.sp),
            ],
          ),
        )
      ],
    );
  }
}
