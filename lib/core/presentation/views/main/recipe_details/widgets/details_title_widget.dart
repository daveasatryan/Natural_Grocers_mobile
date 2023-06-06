import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';

class DetailsTitleWidget extends StatelessWidget {
  final String? videoUrl;
  final String? serves;
  final String? totalTime;
  final List<String>? tags;

  const DetailsTitleWidget({
    super.key,
    this.videoUrl,
    this.serves,
    this.totalTime,
    this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: tags?.map((tag) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Chip(
                      label: Text(
                        tag,
                        style: context.fonts.latoRegularItalic.copyWith(
                          color: context.colors.blackOpacityColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 3.sp),
                  ],
                );
              }).toList() ??
              [],
        ),
        SizedBox(height: 27.sp),
        AspectRatio(
          aspectRatio: 337 / 240,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.sp),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.mockPicture),
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 55.sp,
                    width: 55.sp,
                    decoration: BoxDecoration(
                        color: context.colors.whiteColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: context.colors.borderTrueColor)),
                    child: Icon(Icons.play_arrow_rounded,
                        color: context.colors.borderTrueColor, size: 30.sp),
                  ),
                ),
              ),
              Container(
                height: 50.sp,
                decoration: BoxDecoration(
                  color: context.colors.black.withOpacity(.56),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.sp),
                    bottomRight: Radius.circular(16.sp),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 12.sp),
                            padding: EdgeInsets.symmetric(horizontal: 10.sp),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(color: context.colors.whiteColor, width: 2),
                            ),
                            child: Text(
                              '10',
                              style: context.fonts.latoBlack
                                  .copyWith(color: context.colors.whiteColor),
                            ),
                          ),
                          Positioned(
                            right: 55,
                            child: InkWell(
                              child: SvgPicture.asset(
                                AppAssets.starIcon,
                                colorFilter: ColorFilter.mode(
                                  context.colors.orangeColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.sp),
                      child: VerticalDivider(
                        color: context.colors.verticalDividerGreyColor,
                        thickness: 2,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.share_outlined, color: context.colors.whiteColor),
                          SizedBox(width: 8.sp),
                          Text(
                            context.strings.share,
                            style: context.fonts.latoBoldItalic
                                .copyWith(color: context.colors.whiteColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.sp),
        Padding(
          padding: EdgeInsets.only(left: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(TextSpan(
                  text: context.strings.serves,
                  style: context.fonts.latoSemiBoldItalic.copyWith(
                    fontSize: 18.sp,
                  ),
                  children: [
                    TextSpan(
                        text: ': $serves',
                        style: context.fonts.latoRegular
                            .copyWith(fontSize: 16.sp, fontStyle: FontStyle.normal))
                  ])),
              SizedBox(height: 5.sp),
              Text.rich(TextSpan(
                  text: context.strings.total_time,
                  style: context.fonts.latoSemiBoldItalic.copyWith(
                    fontSize: 18.sp,
                  ),
                  children: [
                    TextSpan(
                        text: ': $totalTime',
                        style: context.fonts.latoRegular
                            .copyWith(fontSize: 16.sp, fontStyle: FontStyle.normal))
                  ]))
            ],
          ),
        )
      ],
    );
  }
}
