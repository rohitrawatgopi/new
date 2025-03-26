import 'package:know_go/imports/app_imports.dart';

class FolderButton extends StatelessWidget {
  const FolderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/coming_soon'),
        child: Card(
          color: AppColors.appBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(child: Image.asset('assets/images/folder.png')),
        ),
      ),
    );
  }
}
