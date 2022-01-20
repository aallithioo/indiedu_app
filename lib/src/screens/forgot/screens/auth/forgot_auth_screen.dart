import '../../widgets/forgot_body.dart';
import 'package:flutter/material.dart';

class ForgotAuthScreen extends StatelessWidget {
  const ForgotAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgotBody(),
    );
  }
}
