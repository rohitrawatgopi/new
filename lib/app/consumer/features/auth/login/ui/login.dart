import 'package:know_go/app/consumer/features/auth/login/bloc/login_bloc.dart';
import 'package:know_go/imports/app_imports.dart';

class ConsumerLogin extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();
  bool isChecked = false;
  LoginBloc loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      listenWhen: (previous, current) => current is LoginActionState,
      buildWhen: (previous, current) => current is! LoginActionState,
      listener: (context, state) {
        switch (state.runtimeType) {
          case LoginFailState:
            final loginFailState = state as LoginFailState;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(loginFailState.error)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              const Background(),
              DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.6,
                maxChildSize: 1,
                builder: (context, scrollController) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.appWhite,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(100),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40,
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              title: Texts.welcomeBack,
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
                            AppTextField(
                              controller: _phoneController,
                              hintText: 'Phone Number',
                              keyBoardType: TextInputType.phone,
                              prefixIcon: const Icon(Icons.phone),
                            ),
                            const SizedBox(height: 14),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: Transform.scale(
                                      scale: 0.6,
                                      child: Checkbox(
                                        value: isChecked,
                                        checkColor: AppColors.appWhite,
                                        fillColor: MaterialStateProperty.all(
                                          isChecked
                                              ? AppColors.appBlack
                                              : AppColors.appWhite,
                                        ),
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: AppText(
                                      title: Texts.rememberMe,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: InkWell(
                                        onTap: () {},
                                        child: AppText(
                                          title: Texts.forgotPassword,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            AppButton(
                              onPressed: () {
                                loginBloc.add(
                                  SubmitLoginEvent(
                                    phoneNumber: _phoneController.text,
                                  ),
                                );
                              },
                              title: Texts.login,
                            ),
                            const SizedBox(height: 12),
                            Center(
                              child: GestureDetector(
                                onTap: () {},
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: Texts.notHaveAccount,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.appColor,
                                      fontFamily: 'Poppins',
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' ${Texts.signUp}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.linkColor,
                                          fontFamily: 'Poppins',
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
