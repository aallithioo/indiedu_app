import '../../../app/themes/color.dart';
import '../../../app/themes/fontweight.dart';
import '../../../app/themes/size.dart';
import '../../../app/themes/textalign.dart';
import '../../../app/themes/theme.dart';

import '../../../app/widgets/custom_padding.dart';
import '../../../app/widgets/custom_sizebox.dart';

import 'sign_in_form.dart';

import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: kPaddingSymetricHorizontalLarge,
          child: SingleChildScrollView(
            child: Column(
              children: [
                kSizeBoxVerticalMedium,
                // Logo
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/images/png/img_logo.png'),
                ),
                // Description title
                Container(
                  margin: EdgeInsets.fromLTRB(0, kSizeTiny, 0, 0),
                  child: Text(
                    'Welcome back!',
                    style: indiedu.textTheme.headline5!.copyWith(
                      color: kGreyColorShade900,
                      fontWeight: kFontWeightSemiBold,
                    ),
                  ),
                ),
                // Description subtitle
                Container(
                  margin: EdgeInsets.fromLTRB(0, kSizeSmall, 0, kSizeLarge),
                  padding: kPaddingSymetricHorizontalMedium,
                  child: Text(
                    'Please type your email and password to sign in.',
                    style: indiedu.textTheme.bodyText1!.copyWith(),
                    textAlign: kTextAlignCenter,
                  ),
                ),
                kSizeBoxVerticalSmall,
                const SignInForm(),
                kSizeBoxVerticalLarge,
                Text(
                  '\u00a9 2022 indiedu, All rights reserved.',
                  style: indiedu.textTheme.caption!.copyWith(
                    color: kGreyColorShade300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
