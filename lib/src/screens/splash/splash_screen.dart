import 'dart:async';

import '../../data/provider/provider.dart';

import '../../app/routes/route.dart';

import 'widgets/splash_body.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkToken();
  }

  checkToken() async {
    AuthProvider authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );

    await authProvider.checkToken();

    print('token : ' + authProvider.token!.token.toString());
    Timer(
      const Duration(seconds: 2),
      () {
        if (authProvider.token!.token != null) {
          Navigator.pushReplacementNamed(
            context,
            Routes.home,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            Routes.warn,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
