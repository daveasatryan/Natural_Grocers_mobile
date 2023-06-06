import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/color/app_colors.dart';

class CustomTabIndicator extends Decoration {
  final BoxPainter _painter;

  CustomTabIndicator({Color? color, double? radius})
      : _painter = _CustomPainter(color ?? AppColors().orangeBorderColor, radius ?? 8.sp);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CustomPainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CustomPainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    // canvas.drawCircle(offset, radius, _paint);
    canvas.drawRect(Rect.fromCircle(center: offset, radius: radius), _paint);
  }
}
