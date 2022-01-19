import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:aallithioo/src/app/widgets/custom_sizebox.dart';

import '../../../app/themes/fontweight.dart';
import '../../../app/themes/textalign.dart';
import '../../../app/themes/theme.dart';
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
          'tooko',
          style: tooko.textTheme.headline4!.copyWith(
            color: tooko.textTheme.headline4!.color,
            fontWeight: kFontWeightBold,
          ),
          textAlign: kTextAlignCenter,
        ),
        kSizeBoxVerticalSmall,
        Text(
          text!,
          textAlign: kTextAlignCenter,
        ),
        const Spacer(flex: 2),
        Padding(
          padding: kPaddingSymetricHorizontalMedium,
          child: Image.asset(
            image!,
            height: 200,
            width: 200,
          ),
        ),
      ],
    );
  }
}
