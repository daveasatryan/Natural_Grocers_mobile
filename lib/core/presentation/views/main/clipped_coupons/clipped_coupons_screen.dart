import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/enums/clipped_page_type.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/clipped_coupons/bloc/clipped_coupons_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/clipped_coupons/bloc/clipped_coupons_event.dart';
import 'package:natural_groceries/core/presentation/views/main/clipped_coupons/bloc/clipped_coupons_state.dart';
import 'package:natural_groceries/core/presentation/views/main/clipped_coupons/widget/clipped_coupons_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class ClippedCouponsScreen extends StatefulWidget {
  const ClippedCouponsScreen({
    super.key,
  });

  @override
  State<ClippedCouponsScreen> createState() => _ClippedCouponsScreenState();
}

class _ClippedCouponsScreenState extends State<ClippedCouponsScreen> with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        backgroundColor: context.colors.whiteColor,
        body: BlocProvider(
          create: (context) => context.read<BlocFactory>().create<ClippedCouponBloc>(),
          child: BlocBuilder<ClippedCouponBloc, ClippedCouponsState>(
            builder: (context, state) {
              final page = state.page;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 100.sp),
                  child: _content(context, page),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Column _content(BuildContext context, ClippedPageType page) {
    return Column(
      children: [
        HeaderWidget(
          headerWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                strings.clipped_coupons,
                style: fonts.latoBlackItalic.copyWith(
                  color: context.colors.whiteColor,
                  fontSize: 26.sp,
                ),
                maxLines: 1,
              ),
              SizedBox(width: 10.sp),
              SvgPicture.asset(AppAssets.availableCouponsIcons)
            ],
          ),
          isNested: true,
          height: 97.sp,
        ),
        SizedBox(height: 24.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ClippedPageType.values
              .map(
                (e) => InkWell(
                  onTap: () => context.read<ClippedCouponBloc>().add(
                        ClippedCouponsEvent.changePage(e),
                      ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.title,
                        style: (e == page
                                ? context.fonts.latoBoldItalic
                                : context.fonts.latoLightItalic)
                            .copyWith(fontSize: 24.sp),
                      ),
                      SizedBox(height: 8.sp),
                      if (e == page)
                        Container(
                          height: 4.sp,
                          width: 51.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: context.colors.greenTabBorderColor,
                          ),
                        )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(height: 100.sp),
        ClippedCouponsWidget(type: page.offerType),
      ],
    );
  }
}
