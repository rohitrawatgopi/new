import 'package:know_go/imports/app_imports.dart';

class Background extends StatelessWidget {
  final bool isBack;
  const Background({super.key, this.isBack = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black,
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.6),
                Colors.white,
              ],
              stops: [0.0, 0.6, 0.9, 1.0],
            ),
          ),
        ),
        Positioned(
          top: 75,
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', height: 200),
                AppText(
                  title: Texts.knowBefore,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: AppColors.appWhite,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 30,
          child: Visibility(
            visible: isBack,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new, color: AppColors.appWhite),
            ),
          ),
        ),
      ],
    );
  }
}
