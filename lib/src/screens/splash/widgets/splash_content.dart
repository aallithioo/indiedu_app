import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: const Image(
        image: AssetImage(
          "assets/images/png/img_logo.png",
        ),
      ),
    );
  }
}
