import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/enums/offer_type_enum.dart';
import 'package:natural_groceries/core/data/models/dashboard/coupons/coupon_model.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class CouponItemWidget extends StatelessWidget with BaseStatelessMixin {
  const CouponItemWidget({
    super.key,
    required this.coupon,
    required this.type,
  });

  final CouponModel? coupon;
  final OfferTypeEnum type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.sp),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.sp,
          horizontal: 18.sp,
        ),
        decoration: BoxDecoration(
          color: context.colors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: context.colors.profileBorder,
              blurRadius: 4,
              offset: const Offset(2, 6),
            ),
            BoxShadow(
              color: context.colors.profileBorder,
              blurRadius: 4,
              offset: const Offset(-2, 6),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(30.sp),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: coupon?.imageURL ?? '',
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: context.sizes.width * .16,
                      height: 83,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  progressIndicatorBuilder: (context, url, progress) =>
                      const CircularProgressIndicator.adaptive(),
                ),
                SizedBox(
                  width: context.sizes.width * .17,
                  child: SvgPicture.asset(type.icon),
                ),
              ],
            ),
            SizedBox(height: 3.sp),
            Text(
              context.strings.expires(coupon?.expirationDate ?? ''),
              style: context.fonts.latoBold.copyWith(
                fontSize: 14.sp,
                color: context.colors.whisperBorderColor,
              ),
            ),
            SizedBox(height: 3.sp),
            Text(
              coupon?.shortDescription ?? '',
              style: context.fonts.latoBold.copyWith(
                fontSize: 18.sp,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 3.sp),
            Text(
              coupon?.brand ?? '',
              style: context.fonts.latoRegular.copyWith(
                color: context.colors.whisperBorderColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
