import 'package:know_go/imports/app_imports.dart';

class AppBottomSheetTheme {
  AppBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: AppColors.appWhite,
    modalBackgroundColor: AppColors.appWhite,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: AppColors.appBlack,
    modalBackgroundColor: AppColors.appBlack,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
