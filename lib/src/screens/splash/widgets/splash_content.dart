import 'package:aallithioo/src/app/themes/theme.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          'Tooko',
          style: tooko.textTheme.headline6!.copyWith(
            color: tooko.textTheme.headline6!.color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
