import 'package:flutter/material.dart';

import 'src/app/routes/route.dart';

import 'src/screens/intro/intro_screen.dart';
import 'src/screens/sign_in/sign_in_screen.dart';
import 'src/screens/splash/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.splash,
      routes: <String, WidgetBuilder>{
        Routes.splash: (_) => const SplashScreen(),
        Routes.intro: (_) => const IntroScreen(),
        Routes.signIn: (_) => const SignInScreen(),
      },
    );
  }
}
