import 'package:know_go/imports/app_imports.dart';

class AppText extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final FontStyle? fontStyle;
  const AppText({
    super.key,
    required this.title,
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDecoration,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        overflow: textOverflow,
        fontFamily: 'Poppins',
        decoration: textDecoration,
        fontStyle: fontStyle,
      ),
    );
  }
}

class ReqAppText extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  const ReqAppText({
    super.key,
    required this.title,
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDecoration,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(
          color: color ?? AppColors.appBlack,
          fontSize: fontSize,
          fontFamily: 'Montserrat',
          fontWeight: fontWeight,
          overflow: textOverflow,
          decoration: textDecoration,
        ),
        children: [
          TextSpan(
            text: ' *',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: AppColors.appRed,
            ),
          ),
        ],
      ),
    );
  }
}
