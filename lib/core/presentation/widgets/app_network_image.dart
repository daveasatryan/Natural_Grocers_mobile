import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';

class AppNetworkImage extends StatelessWidget {
  final String? url;
  final Function(BuildContext, String, dynamic)? errorWidget;
  final BorderRadiusGeometry? borderRadius;

  const AppNetworkImage(
    this.url, {
    super.key,
    this.errorWidget,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: (borderRadius ?? BorderRadius.circular(8.sp)),
      ),
      child: CachedNetworkImage(
        imageUrl: url ?? '',
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: (borderRadius ?? BorderRadius.circular(8.sp)),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              // colorFilter: const ColorFilter.mode(Colors.red, BlendMode.colorBurn),
            ),
          ),
        ),
        progressIndicatorBuilder: (context, url, progress) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: (borderRadius ?? BorderRadius.circular(8.sp)),
            ),
            child: Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: SizedBox(
                  width: 30.sp,
                  height: 30.sp,
                  child: CircularProgressIndicator(
                    value: progress.progress,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      context.colors.mainAppColor,
                    ),
                    color: context.colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) =>
            errorWidget?.call(context, url, error) ??
            Container(
              decoration: BoxDecoration(
                borderRadius: (borderRadius ?? BorderRadius.circular(8.sp)),
                color: Colors.blue.withOpacity(.4),
              ),
            ),
      ),
    );
  }
}
