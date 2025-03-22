import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

final ThemeData themeData = ThemeData(
  primaryColor: CustomColors.primaryBlue,
  scaffoldBackgroundColor: CustomColors.lightWhite,
  fontFamily: 'Gilroy',
  menuTheme: MenuThemeData(
    style: MenuStyle(
      backgroundColor: WidgetStateProperty.all(CustomColors.primaryWhite),
      surfaceTintColor: WidgetStateProperty.all(CustomColors.primaryWhite),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
          side: BorderSide(color: CustomColors.primaryBlue, width: 2.sp),
        ),
      ),
      padding: WidgetStatePropertyAll(EdgeInsets.all(10.sp)),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: CustomColors.primaryBlack,
        ),
      ),
    ),
  ),
  iconTheme: IconThemeData(size: 20.sp),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
  ),
  sliderTheme: SliderThemeData(trackHeight: 2.sp),
  textTheme: TextTheme(
    /// Огромные и жирные
    headlineLarge: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),

    /// Самые жирные
    titleLarge: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),

    /// Менее жирнее чем тайтлы, но жирнее чем боди
    labelLarge: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    labelSmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),

    /// Для дефолтных текстов
    bodyLarge: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),

    ///
    displaySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
  ),
);
