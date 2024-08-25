import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFonts
{
  static TextStyle get getAppFontType => const TextStyle(fontFamily: 'Poppins');

  static TextStyle get headlineTextStyle => getAppFontType;

  static TextStyle get bodyTextStyle => getAppFontType;

  static TextStyle get buttonTextStyle => getAppFontType;

  static TextStyle get appBarTextStyle  => getAppFontType;

  static TextStyle get chipTextStyle  => getAppFontType;

  static double get appBarTittleSize => 18.sp;

  static TextStyle get displayTextStyle => getAppFontType;

  static double get bodySmallTextSize => 12.sp;
  static double get bodyMediumSize => 14.sp;
  static double get bodyLargeSize => 20.sp;
  static double get displayLargeSize => 24.sp;
  static double get displayMediumSize => 18.sp;
  static double get displaySmallSize => 14.sp;

  static double get body1TextSize => 20.sp;
  static double get body2TextSize => 14.sp;

  static double get buttonTextSize => 16.sp;

  static double get captionTextSize => 13.sp;

  static double get chipTextSize => 10.sp;
}