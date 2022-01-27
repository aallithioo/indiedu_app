import 'dart:async';

import 'package:aallithioo/src/data/provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../../app/routes/route.dart';

import 'widgets/splash_body.dart';

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

    print(authProvider.token!.token);
    Timer(
      const Duration(seconds: 2),
      () {
        if (authProvider.token!.token != null ||
            FirebaseAuth.instance.currentUser!.uid != null) {
          Navigator.pushReplacementNamed(
            context,
            Routes.warn,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            Routes.signIn,
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
