import 'package:flutter/material.dart';

import 'widgets/sign_up_auth_body.dart';

class SignUpAuthScreen extends StatelessWidget {
  const SignUpAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpAuthBody(),
    );
  }
}
