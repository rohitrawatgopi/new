import 'package:know_go/imports/app_imports.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double? hight;
  final double? width;
  final Function() onPressed;
  final bool isLoading;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final bool? isDisabled;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? widget;
  final GlobalKey? buttonKey;
  final double radius;
  final double? elevation;
  final Color? disabledTextColor;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.hight,
    this.width,
    this.color,
    this.radius = 30,
    this.textColor,
    this.disabledTextColor,
    this.borderColor,
    this.fontSize = 16,
    this.elevation,
    this.widget,
    this.fontWeight = FontWeight.w600,
    this.isDisabled = false,
    this.isLoading = false,
    this.buttonKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Container(
        key: buttonKey,
        width: width ?? MediaQuery.of(context).size.width - 40,
        height: hight ?? 50,
        decoration: BoxDecoration(
          color: color ?? AppColors.appColor,
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: ElevatedButton(
          onPressed: isLoading == true || isDisabled == true ? null : onPressed,
          style: ButtonStyle(
            elevation: WidgetStatePropertyAll(elevation ?? 0),
            surfaceTintColor: WidgetStatePropertyAll(
              isDisabled == true
                  ? AppColors.appGray
                  : color ?? AppColors.appColor,
            ),
            backgroundColor: WidgetStatePropertyAll(
              isDisabled == true
                  ? AppColors.appGray
                  : color ?? AppColors.appColor,
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
          ),
          child: Center(
            child:
                isLoading == true
                    ? LoadingAnimationWidget.hexagonDots(
                      color: AppColors.appWhite,
                      size: 40,
                    )
                    : title.isNotEmpty
                    ? Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSize,
                        color:
                            isDisabled == true
                                ? disabledTextColor ?? AppColors.appGray
                                : textColor ?? AppColors.appWhite,
                        fontWeight: fontWeight,
                      ),
                    )
                    : widget,
          ),
        ),
      ),
    );
  }
}
