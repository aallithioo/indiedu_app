import 'widgets/forgot_auth_reset_success_body.dart';
import 'package:flutter/material.dart';

class ForgotAuthResetSuccessScreen extends StatelessWidget {
  const ForgotAuthResetSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgotAuthResetSuccessBody(),
    );
  }
}
