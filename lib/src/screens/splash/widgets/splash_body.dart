import 'package:aallithioo/src/screens/splash/widgets/splash_content.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: SplashContent(),
      ),
    );
  }
}
