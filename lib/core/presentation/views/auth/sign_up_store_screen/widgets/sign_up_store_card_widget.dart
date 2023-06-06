import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/dialog_icons.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class SignUpStoreCardWidget extends StatelessWidget with BaseStatelessMixin {
  final StoreModel? store;

  const SignUpStoreCardWidget({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.sp),
      ),
      elevation: 2.sp,
      child: Padding(
        padding: EdgeInsets.all(19.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 25.sp,
                  height: 25.sp,
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colors.purpleTransparent,
                  ),
                  child: Image.asset(AppAssets.icMark),
                ),
                SizedBox(width: 5.sp),
                Flexible(
                  child: Text(
                    store?.fullTitle ?? '',
                    style: context.fonts.latoBoldItalic.copyWith(
                      fontSize: 18.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.sp),
            Text(
              store?.address ?? '18471 Green Valle Ranch Blvd\nDenver, CO 80249',
              style: context.fonts.latoRegular.copyWith(
                fontSize: 14.sp,
                color: context.colors.whisperOpacityColor,
              ),
            ),
            SizedBox(height: 4.sp),
            InkWell(
              onTap: () {
                showTwoOptionDialog(context,
                    title: context.strings.set_as_preferred_store_title,
                    msg: context.strings.set_preferred_store_dialog_msg,
                    negativeButtonText: context.strings.no_title,
                    positiveButtonText: context.strings.yes_title,
                    msgPadding: EdgeInsets.symmetric(horizontal: 25.sp),
                    icon: DialogIcons.question, positiveButtonClick: () {
                  AppRoutes.back(result: store);
                });
              },
              child: Text(
                context.strings.set_as_preferred_store_title,
                style: context.fonts.latoBlack.copyWith(
                  color: context.colors.borderTrueColor,
                  fontSize: 14.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
