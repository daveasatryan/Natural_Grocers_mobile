import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:natural_groceries/core/data/models/user/user_model.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class MyPersonalInformation extends StatelessWidget with BaseStatelessMixin {
  final UserModel? userModel;

  const MyPersonalInformation({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 340 / 158,
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: context.colors.profileBorder,
              blurRadius: 4,
              offset: const Offset(4, 8),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(15.sp),
          ),
          border: Border.fromBorderSide(
            BorderSide(
              color: context.colors.profileBorder,
            ),
          ),
        ),
        width: context.sizes.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10.sp),
            userModel?.profilePicture.isNullOrEmpty() == true
                ? SvgPicture.asset(AppAssets.profileIcon)
                : CachedNetworkImage(
                    imageUrl: userModel?.profilePicture ?? '',
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: 75.sp,
                        width: 75.sp,
                        decoration: BoxDecoration(
                          image: DecorationImage(fit: BoxFit.cover, image: imageProvider),
                        ),
                      );
                    },
                  ),
            SizedBox(width: 10.sp),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.strings.email,
                  style: context.fonts.latoRegular,
                ),
                SizedBox(height: 2.sp),
                Text(
                  userModel?.email ?? '',
                  style: context.fonts.latoBold.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 5.sp),
                Text(
                  '${context.strings.phone_number}: ',
                  style: context.fonts.latoRegular,
                ),
                SizedBox(height: 2.sp),
                Text(
                  MaskTextInputFormatter(mask: '###-###-####').maskText(
                    userModel?.userPhoneNumber ?? '',
                  ),
                  style: context.fonts.latoBold.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 5.sp),
                Text(
                  context.strings.password,
                  style: context.fonts.latoRegular,
                ),
                SizedBox(height: 2.sp),
                Text(
                  '***********',
                  style: context.fonts.latoBold.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
