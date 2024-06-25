import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';
import '../app_styles.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: Colors.white,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.blue,
        selectionHandleColor: Colors.blue,
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.grey[200],
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: AppStyles.textStyle43SB.copyWith(
          color: Colors.black,
        ),
        bodyMedium: AppStyles.textStyle18R.copyWith(
          color: Colors.black,
        ),
        bodySmall: AppStyles.textStyle23R.copyWith(
          color: Colors.black,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))));

  static ThemeData darkTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Colors.blue,
      selectionHandleColor: Colors.blue,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppStyles.textStyle43SB.copyWith(
        color: Colors.white,
      ),
      bodyMedium: AppStyles.textStyle18R.copyWith(
        color: Colors.white,
      ),
      bodySmall: AppStyles.textStyle23R.copyWith(
        color: Colors.white,
      ),
    ),
    primaryColor: const Color(0xff252525),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.mainColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff252525),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    ),
  );
}
