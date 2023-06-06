import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/n_power_faqs/widgets/n_power_faqs_footer.dart';
import 'package:natural_groceries/core/presentation/views/n_power_faqs/widgets/n_power_faqs_header.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class NPowerFaqs extends StatelessWidget {
  const NPowerFaqs({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        backgroundColor: context.colors.whiteColor,
        bottomNavigationBar: Container(
          height: 100,
          color: context.colors.greenScreenColor,
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(115.sp),
          child: HeaderWidget(
            headerWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.strings.n_power_faq(AppConstants.nPower),
                  style: context.fonts.latoBoldItalic.copyWith(
                    fontSize: 34.sp,
                    color: context.colors.whiteColor,
                  ),
                ),
                SizedBox(height: 2.sp),
                Container(
                  width: 65.sp,
                  height: 5.sp,
                  decoration: BoxDecoration(
                    color: context.colors.greenWithOpacity,
                    borderRadius: BorderRadius.circular(100.sp),
                  ),
                )
              ],
            ),
            height: 115.sp,
            headerImagePath: AppAssets.npowerFaqsHeaderImage,
            text: '',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 33.sp, horizontal: 20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const NPowerFaqsHeader(),
                SizedBox(height: 32.sp),
                const NPowerFaqsFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
