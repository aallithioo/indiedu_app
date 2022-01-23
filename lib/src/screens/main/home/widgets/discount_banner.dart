import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/themes/fontweight.dart';
import 'package:aallithioo/src/app/themes/size.dart';
import 'package:aallithioo/src/app/themes/theme.dart';
import 'package:aallithioo/src/app/widgets/custom_border.dart';
import 'package:aallithioo/src/app/widgets/custom_margin.dart';
import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: kMarginAllSmall,
      padding: kPaddingAllMedium,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            kBlueColorShade300,
            kBlueColorShade600,
            kBlueColorShade500,
          ],
        ),
        borderRadius: kBorderRadiusSmall,
      ),
      child: Text.rich(
        TextSpan(
          style: tooko.textTheme.bodyText1!.copyWith(
            color: kGreyColorShade50,
          ),
          children: [
            const TextSpan(text: 'A Summer Surprise\n'),
            TextSpan(
              text: 'Cashback 20%',
              style: tooko.textTheme.bodyText1!.copyWith(
                color: kGreyColorShade50,
                fontSize: kSizeMedium,
                fontWeight: kFontWeightBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
