import 'widgets/forgot_auth_reset_body.dart';
import 'package:flutter/material.dart';

class ForgotAuthResetScreen extends StatelessWidget {
  const ForgotAuthResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgotAuthResetBody(),
    );
  }
}
