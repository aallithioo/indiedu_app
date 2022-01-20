import 'package:flutter/material.dart';

import 'widgets/forgot_body.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgotBody(),
    );
  }
}
