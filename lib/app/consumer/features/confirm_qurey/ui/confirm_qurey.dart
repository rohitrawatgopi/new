import 'package:know_go/app/consumer/features/confirm_qurey/bloc/confirm_query_bloc.dart';
import 'package:know_go/app/consumer/features/confirm_qurey/bloc/confirm_query_state.dart'
    show ConfirmQueryInitial, ConfirmQueryState;
import 'package:know_go/constants/show_message.dart';
import 'package:know_go/imports/app_imports.dart';

class ConfirmQueryScreen extends StatelessWidget {
  final String initialQueryText;

  const ConfirmQueryScreen({super.key, required this.initialQueryText});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmQueryBloc(initialQueryText),
      child: BlocBuilder<ConfirmQueryBloc, ConfirmQueryState>(
        builder: (context, state) {
          final queryState = state as ConfirmQueryInitial;

          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    top: 35.0,
                    left: 20.0,
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
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (!queryState.showEstimatedPrice)
                          const Text(
                            "Do you mean this?",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        if (queryState.showEstimatedPrice)
                          const Text(
                            "Estimated price range for your task",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        const SizedBox(height: 16),
                        if (!queryState.showEstimatedPrice)
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              queryState.queryText,
                              style: const TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!queryState.showEstimatedPrice)
                              ElevatedButton(
                                onPressed: () {
                                  context.read<ConfirmQueryBloc>().add(
                                    ToggleEstimatedPriceEvent(),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.appColor,
                                ),
                                child: const AppText(
                                  title: "Yes",
                                  color: AppColors.appWhite,
                                ),
                              ),
                            if (!queryState.showEstimatedPrice)
                              const SizedBox(width: 16),
                          ],
                        ),
                        const SizedBox(height: 20),
                        if (queryState.showEstimatedPrice)
                          ElevatedButton(
                            onPressed: () {
                              ShowToastMessage.showSuccess(
                                "Your tasks have been added to the cart.",
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomNavigation(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.appColor,
                            ),
                            child: const AppText(
                              title: "Go AutoPilot",
                              color: AppColors.appWhite,
                            ),
                          ),
                        const SizedBox(height: 20),
                        if (queryState.showEstimatedPrice)
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.appDarkGray,
                            ),
                            child: const AppText(
                              title: "Add Service",
                              color: AppColors.appWhite,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
