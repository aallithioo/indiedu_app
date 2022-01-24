import '../../app/routes/route.dart';

import '../../app/themes/color.dart';
import '../../app/themes/fontweight.dart';
import '../../app/themes/size.dart';
import '../../app/themes/theme.dart';

import '../../app/widgets/custom_padding.dart';
import '../../app/widgets/custom_sizebox.dart';

import 'package:flutter/material.dart';

class WarnScreen extends StatelessWidget {
  const WarnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kPaddingSymetricHorizontalLarge,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'EARLY ACCESS',
                style: indiedu.textTheme.headline6!.copyWith(
                  color: kErrorColor,
                  fontSize: kSizeMedium,
                  fontWeight: kFontWeightBold,
                ),
              ),
              kSizeBoxVerticalMedium,
              Text(
                'Please be known that the app still in the development and this patch is the EARLY ACCESS version, as the developer of this app we are open for every critics, suggesstions, and all that can improve this app better',
                style: indiedu.textTheme.bodyText2!.copyWith(
                  color: kGreyColorShade600,
                  fontSize: 14,
                  fontWeight: kFontWeightLight,
                ),
                textAlign: TextAlign.center,
              ),
              kSizeBoxVerticalLarge,
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.intro,
                  );
                },
                child: Text(
                  'Be a Beta Tester',
                  style: indiedu.textTheme.button!.copyWith(
                    color: kBlueColorShade400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
