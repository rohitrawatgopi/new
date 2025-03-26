import 'package:flutter/gestures.dart';
import 'package:know_go/app/consumer/features/auth/signup/bloc/signup_bloc.dart';
import 'package:know_go/imports/app_imports.dart';

class ConsumerSignup extends StatelessWidget {
  const ConsumerSignup({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Scaffold(
        body: BlocConsumer<SignupBloc, SignupState>(
          listenWhen: (previous, current) => current is SignupActionState,
          buildWhen: (previous, current) => current is! SignupActionState,
          listener: (context, state) {
            if (state is SignupFailState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            } else if (state is SignupSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Signup Successful!")),
              );
              // navigateTo(context: context, to: const BottomNavigation());
            }
          },
          builder: (context, state) {
            final signupBloc = context.read<SignupBloc>();

            bool isChecked =
                state is SignupCheckboxState ? state.isChecked : false;
            bool isAgeChecked =
                state is SignupCheckboxState ? state.isAgeChecked : false;

            return Stack(
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
                                title: Texts.createAccount,
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: AppColors.appColor,
                              ),
                              AppText(
                                title: Texts.signUp,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              const SizedBox(height: 30),
                              AppTextField(
                                controller: nameController,
                                hintText: 'Full Name',
                                prefixIcon: const Icon(Icons.person),
                              ),
                              const SizedBox(height: 14),
                              AppTextField(
                                controller: phoneController,
                                hintText: 'Phone Number',
                                keyBoardType: TextInputType.phone,
                                prefixIcon: const Icon(Icons.phone),
                              ),
                              const SizedBox(height: 14),

                              /// 🔹 **CheckBoxes**
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: isChecked,
                                        onChanged: (value) {
                                          signupBloc.add(
                                            ToggleCheckboxEvent(
                                              isChecked: value ?? false,
                                              isAgeChecked: isAgeChecked,
                                            ),
                                          );
                                        },
                                      ),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                            children: [
                                              const TextSpan(
                                                text: "I agree to the ",
                                              ),
                                              TextSpan(
                                                text: "Terms of Use",
                                                style: const TextStyle(
                                                  color: Colors.blue,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // Open Terms of Use
                                                      },
                                              ),
                                              const TextSpan(text: " and "),
                                              TextSpan(
                                                text: "Privacy Policy.",
                                                style: const TextStyle(
                                                  color: Colors.blue,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // Open Privacy Policy
                                                      },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: isAgeChecked,
                                        onChanged: (value) {
                                          signupBloc.add(
                                            ToggleCheckboxEvent(
                                              isChecked: isChecked,
                                              isAgeChecked: value ?? false,
                                            ),
                                          );
                                        },
                                      ),
                                      const Text(
                                        'I am 18+ years old',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              const SizedBox(height: 30),
                              AppButton(
                                onPressed: () {
                                  signupBloc.add(
                                    SubmitSignupEvent(
                                      name: nameController.text,
                                      phoneNumber: phoneController.text,
                                      isChecked: isChecked,
                                      isAgeChecked: isAgeChecked,
                                    ),
                                  );
                                },
                                title: Texts.signUp,
                              ),
                              const SizedBox(height: 12),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    // Handle navigation to Login
                                  },
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: Texts.signUp,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.appColor,
                                        fontFamily: 'Poppins',
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' ${Texts.login}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.linkColor,
                                            fontFamily: 'Poppins',
                                            decoration:
                                                TextDecoration.underline,
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
            );
          },
        ),
      ),
    );
  }
}
