import 'package:know_go/imports/app_imports.dart';

class Common extends StatefulWidget {
  const Common({super.key});

  @override
  State<Common> createState() => _CommonState();
}

class _CommonState extends State<Common> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Background(isBack: false),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.appWhite,
              borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
            ),
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: Texts.joinNow,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppColors.appColor,
                      ),
                      AppText(
                        title: Texts.subTitle,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: SizedBox(
                          width: 230,
                          child: AppButton(
                            onPressed: () {
                              navigateTo(context: context, to: Welcome());
                            },
                            title: "Consumer",
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: SizedBox(
                          width: 230,
                          child: AppButton(
                            onPressed: () {
                              // navigateTo(
                              //   context: context,
                              //   to: const LocalmateSiginUp(),
                              // );
                            },
                            title: "LocalMate",
                            color: AppColors.appGray,
                            textColor: AppColors.appBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
