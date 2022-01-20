import 'package:aallithioo/src/screens/sign_up/screens/success/widgets/sign_up_auth_success_body.dart';
import 'package:flutter/material.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpAuthSuccessBody(),
    );
  }
}
