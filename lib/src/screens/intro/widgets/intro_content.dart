import '../../../app/widgets/custom_padding.dart';
import '../../../app/widgets/custom_sizebox.dart';

import '../../../app/themes/fontweight.dart';
import '../../../app/themes/textalign.dart';
import '../../../app/themes/theme.dart';

import 'package:flutter/material.dart';

class IntroContent extends StatelessWidget {
  final String? text, image;
  const IntroContent({
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
        const Spacer(),
        Padding(
          padding: kPaddingSymetricHorizontalMedium,
          child: Image.asset(
            image!,
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}
