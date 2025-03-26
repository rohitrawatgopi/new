import 'package:know_go/imports/app_imports.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThankYouBloc()..add(StartNavigationEvent()),
      child: BlocListener<ThankYouBloc, ThankYouState>(
        listener: (context, state) {
          if (state is NavigateToHomeState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => BottomNavigation()),
              (route) => false,
            );
          }
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/smiley.png', height: 100),
                const SizedBox(height: 20),
                const Text(
                  'Thank you for your feedback!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('You will be directed to the homepage in 3...'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
