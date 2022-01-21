import 'package:flutter/material.dart';

import 'src/app/routes/route.dart';

import 'src/screens/intro/intro_screen.dart';
import 'src/screens/splash/splash_screen.dart';

import 'src/screens/main/home/home_screen.dart';
import 'src/screens/main/my_quiz/my_quiz_screen.dart';
import 'src/screens/main/profile/profile_screen.dart';
import 'src/screens/main/my_learning/my_learning_screen.dart';

import 'src/screens/sign_in/screens/success/sign_in_success_screen.dart';
import 'src/screens/sign_in/sign_in_screen.dart';

import 'src/screens/sign_up/screens/success/sign_up_auth_success_screen.dart';
import 'src/screens/sign_up/screens/auth/sign_up_auth_screen.dart';
import 'src/screens/sign_up/sign_up_screen.dart';

import 'src/screens/forgot/forgot_screen.dart';
import 'src/screens/forgot/screens/auth/forgot_auth_screen.dart';
import 'src/screens/forgot/screens/reset/forgot_auth_reset_screen.dart';
import 'src/screens/forgot/screens/success/forgot_auth_reset_success_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: <String, WidgetBuilder>{
        Routes.splash: (_) => const SplashScreen(),
        Routes.intro: (_) => const IntroScreen(),
        Routes.signIn: (_) => const SignInScreen(),
        Routes.signInSuccess: (_) => const SignInSuccessScreen(),
        Routes.signUp: (_) => const SignUpScreen(),
        Routes.signUpAuth: (_) => const SignUpAuthScreen(),
        Routes.signUpSuccess: (_) => const SignUpSuccessScreen(),
        Routes.forgot: (_) => const ForgotScreen(),
        Routes.forgotAuth: (_) => const ForgotAuthScreen(),
        Routes.reset: (_) => const ForgotAuthResetScreen(),
        Routes.resetSuccess: (_) => const ForgotAuthResetSuccessScreen(),
        Routes.home: (_) => const HomeScreen(),
        Routes.myLearning: (_) => const MyLearningScreen(),
        Routes.myQuiz: (_) => const MyQuizScreen(),
        Routes.profile: (_) => const ProfileScreen(),
      },
    );
  }
}
