import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';

class StoreCardWidget extends StatelessWidget {
  final StoreModel? store;

  const StoreCardWidget({
    super.key,
    this.store,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRoutes.goToNested(AppRoutes.storeDetails, arguments: store),
      child: Card(
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
            ],
          ),
        ),
      ),
    );
  }
}
