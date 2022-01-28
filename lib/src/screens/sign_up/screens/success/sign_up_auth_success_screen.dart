import '../../../../app/themes/color.dart';

import 'widgets/sign_up_auth_success_body.dart';

import 'package:flutter/material.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColorShade900,
      body: const SignUpAuthSuccessBody(),
    );
  }
}
