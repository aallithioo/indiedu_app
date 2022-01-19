import 'package:aallithioo/src/app/themes/fontweight.dart';
import 'package:aallithioo/src/app/themes/textalign.dart';
import 'package:aallithioo/src/app/themes/theme.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  final String? text, image;
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          'Tooko',
          style: tooko.textTheme.headline6!.copyWith(
            color: tooko.textTheme.headline6!.color,
            fontWeight: kFontWeightBold,
          ),
          textAlign: kTextAlignCenter,
        ),
        Text(
          text!,
          textAlign: kTextAlignCenter,
        ),
        const Spacer(flex: 2),
        Image.asset(
          image!,
          height: 150,
          width: 150,
        ),
      ],
    );
  }
}
