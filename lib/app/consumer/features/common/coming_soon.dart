import 'package:know_go/imports/app_imports.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: AppColors.appColor,
                    padding: EdgeInsets.all(56 * 0.3),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.appWhite,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [AppText(title: "Coming Soon", fontSize: 20)],
          ),
        ],
      ),
    );
  }
}
