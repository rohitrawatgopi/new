import 'package:know_go/app/consumer/features/auth/signup/ui/signup.dart';
import 'package:know_go/imports/app_imports.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
                              navigateTo(
                                context: context,
                                to: ConsumerSignup(),
                              );
                            },
                            title: Texts.signUp,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: SizedBox(
                          width: 230,
                          child: AppButton(
                            onPressed: () {
                              //          navigateTo(context: context, to: Login());
                            },
                            title: Texts.login,
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
