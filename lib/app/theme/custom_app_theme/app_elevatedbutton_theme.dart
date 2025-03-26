import 'package:know_go/imports/app_imports.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.appColor,
      disabledForegroundColor: Colors.white.withValues(alpha: 0.6),
      disabledBackgroundColor: AppColors.appColor.withValues(alpha: 0.6),
      side: const BorderSide(color: AppColors.appColor),
      padding: const EdgeInsets.symmetric(vertical: 10),
      textStyle: const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      minimumSize: const Size(230, 47),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.appColor,
      disabledForegroundColor: Colors.white.withValues(alpha: 0.6),
      disabledBackgroundColor: AppColors.appColor.withValues(alpha: 0.6),
      side: const BorderSide(color: AppColors.appColor),
      padding: const EdgeInsets.symmetric(vertical: 10),
      textStyle: const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      minimumSize: const Size(230, 47),
    ),
  );
}
