import 'package:know_go/imports/app_imports.dart';

class FloatButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double size;
  final Color iconColor;
  final String? tooltip;
  const FloatButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = AppColors.appColor,
    this.size = 56.0,
    this.iconColor = Colors.white,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 140),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: backgroundColor,
          padding: EdgeInsets.all(size * 0.3),
        ),
        child: Icon(icon, color: iconColor, size: size * 0.4),
      ),
    );
  }
}
