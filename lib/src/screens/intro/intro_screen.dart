import '../../app/themes/color.dart';

import 'widgets/intro_body.dart';

import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColorShade900,
      body: const IntroBody(),
    );
  }
}
