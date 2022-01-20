import 'package:flutter/material.dart';

import 'widgets/forgot_auth_body.dart';

class ForgotAuthScreen extends StatelessWidget {
  const ForgotAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgotAuthBody(),
    );
  }
}
