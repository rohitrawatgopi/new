import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: AppColors.appWhite,
    appBarTheme: AppBarTheme(
      surfaceTintColor: AppColors.appWhite,
      color: AppColors.appWhite,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.appBlack,
      ),
      bodyMedium: TextStyle(
        color: AppColors.appBlack,
      ),
      bodySmall: TextStyle(
        color: AppColors.appBlack,
      ),
      titleMedium: TextStyle(
        color: AppColors.appBlack,
      ),
      titleSmall: TextStyle(
        color: AppColors.appBlack,
      ),
      titleLarge: TextStyle(
        color: AppColors.appBlack,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.appWhite,
      surfaceTintColor: AppColors.appWhite,
    ),
    iconTheme: IconThemeData(
      color: AppColors.appBlack,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.appBlack,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: AppColors.appDarkGray,
      ),
      labelStyle: TextStyle(
        color: AppColors.appDarkGray,
      ),
      floatingLabelStyle: TextStyle(
        color: AppColors.appBlack,
      ),
      enabledBorder: InputBorder.none,
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      errorBorder: InputBorder.none,
    ),
  );
}
