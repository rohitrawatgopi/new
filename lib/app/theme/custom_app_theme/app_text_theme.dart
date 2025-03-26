import 'package:know_go/imports/app_imports.dart';

class AppTextTheme {
  AppTextTheme._();

  // Light Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      color: AppColors.appBlack,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.w600,
      color: AppColors.appBlack,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.appBlack,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.appBlack,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.appBlack,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.appBlack,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.appBlack,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.appBlack,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.appBlack.withValues(alpha: .5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.appBlack.withOpacity(0.5),
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.appBlack.withOpacity(0.5),
    ),
  );

  //Dark Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      color: AppColors.appWhite,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.w600,
      color: AppColors.appWhite,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.appWhite,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.appWhite,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.appWhite,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.appWhite,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.appWhite,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.appWhite,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.appWhite.withOpacity(0.5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.appWhite.withOpacity((0.5)),
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.appWhite.withOpacity(0.5),
    ),
  );
}
