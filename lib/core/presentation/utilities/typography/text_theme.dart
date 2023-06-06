import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppTextTheme on TextTheme {
  TextStyle get latoBlack => TextStyle(
        fontSize: 16.sp,
        color: const Color(0xFF4B4744),
        fontWeight: FontWeight.w900,
      );

  TextStyle get latoBlackItalic => TextStyle(
        fontSize: 26.sp,
        color: const Color(0xFF4B4744),
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
      );

  TextStyle get latoExtraBold => TextStyle(
        fontSize: 13.sp,
        color: const Color(0xFF4B4744),
        fontWeight: FontWeight.w800,
      );

  TextStyle get latoBold => TextStyle(
        fontSize: 19.sp,
        color: const Color(0xFF4B4744),
        fontWeight: FontWeight.w700,
      );

  TextStyle get latoBoldItalic => TextStyle(
        fontSize: 19.sp,
        color: const Color(0xFF4B4744),
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.italic,
      );

  TextStyle get latoSemiBold => TextStyle(
        fontSize: 18.sp,
        color: const Color(0xFF333333),
        fontWeight: FontWeight.w600,
      );

  TextStyle get latoSemiBoldItalic => TextStyle(
        fontSize: 18.sp,
        color: const Color(0xFF333333),
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
      );

  TextStyle get latoMedium => TextStyle(
        fontSize: 16.sp,
        color: const Color(0xFF4B4744),
        fontWeight: FontWeight.w500,
      );

  TextStyle get latoMediumItalic => TextStyle(
        fontSize: 16.sp,
        color: const Color(0xFF4B4744),
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      );

  TextStyle get latoRegular => TextStyle(
        fontSize: 14.sp,
        color: const Color(0xFF4B4744),
        fontWeight: FontWeight.w400,
      );

  TextStyle get latoRegularItalic => TextStyle(
        fontSize: 14.sp,
        color: const Color(0xFF4B4744),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      );

  TextStyle get latoLightItalic => TextStyle(
        fontSize: 14.sp,
        color: const Color(0xFF4B4744),
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic,
      );

  TextStyle get latoLight => TextStyle(
        fontSize: 18.sp,
        color: const Color(0xFFFFFFFF),
        fontWeight: FontWeight.w300,
      );

  TextStyle get latoThin => TextStyle(
        fontSize: 18.sp,
        color: const Color(0xFFFFFFFF),
        fontWeight: FontWeight.w100,
      );
}
