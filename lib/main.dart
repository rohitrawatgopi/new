import 'package:know_go/app/consumer/features/auth/login/bloc/login_bloc.dart';
import 'package:know_go/app/consumer/features/auth/signup/bloc/signup_bloc.dart';
import 'package:know_go/app/consumer/features/splash/ui/splash_screen.dart';
import 'package:know_go/imports/app_imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => SignupBloc()),
        BlocProvider(create: (context) => HomeBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),

        home: SplashScreen(),
      ),
    );
  }
}
