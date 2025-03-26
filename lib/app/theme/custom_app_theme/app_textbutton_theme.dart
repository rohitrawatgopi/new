import 'package:know_go/imports/app_imports.dart';

class AppTextButtonTheme {
  AppTextButtonTheme._();

  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.appBlack, // Text color
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    ),
  );

  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.appWhite, // Text color
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    ),
  );
}
