import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/info_dialog_point_item.dart';

class InfoDialogWidget extends StatefulWidget {
  const InfoDialogWidget({
    super.key,
    required this.msg,
  });

  final String msg;

  @override
  State<InfoDialogWidget> createState() => _InfoDialogWidgetState();
}

class _InfoDialogWidgetState extends State<InfoDialogWidget> with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: sizes.width * .93,
                maxWidth: sizes.width * .93,
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: 20.sp,
                  left: 8.sp,
                  right: 8.sp,
                ),
                decoration: BoxDecoration(
                  color: colors.whiteColor,
                  borderRadius: BorderRadius.circular(
                    24,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          color: colors.borderTrueColor,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.sp,
                          horizontal: 20.sp,
                        ),
                        child: Text(
                          widget.msg,
                          style: fonts.latoBlackItalic.copyWith(
                            color: colors.whiteColor,
                            fontSize: 18.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 11.sp),
                      InfoDialogPointItem(
                        icon: AppAssets.earnIcon,
                        title: strings.earn_point_for(1, 1),
                        subtitle: strings.excludes_tax,
                      ),
                      InfoDialogPointItem(
                        icon: AppAssets.receiveIcon,
                        title: strings.receive_for_every(1, 200, 10),
                      ),
                      InfoDialogPointItem(
                        icon: AppAssets.getOnYourIcon,
                        title: strings.get_on_your(1, {'N'}),
                      ),
                      InfoDialogPointItem(
                        icon: AppAssets.saveOnEggs,
                        title: strings.save_on_eggs,
                      ),
                      InfoDialogPointItem(
                        icon: AppAssets.getDealsIcon,
                        title: strings.get_deals,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -6.sp,
              right: -6.sp,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(AppAssets.closeIcon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
