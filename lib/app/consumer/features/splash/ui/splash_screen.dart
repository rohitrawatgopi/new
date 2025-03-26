import 'package:know_go/app/consumer/features/splash/bloc/splash_bloc.dart';
import 'package:know_go/imports/app_imports.dart';

import '../../common/common.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(StartSplash()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is NavigateToHome) {
            navigateReplaceMent(context: context, to: Common());
          }
        },
        child: Scaffold(body: Background(isBack: false)),
      ),
    );
  }
}
