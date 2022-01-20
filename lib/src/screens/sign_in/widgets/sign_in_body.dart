import 'package:aallithioo/src/app/no_account_text.dart';
import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/themes/fontweight.dart';
import 'package:aallithioo/src/app/themes/size.dart';
import 'package:aallithioo/src/app/themes/textalign.dart';
import 'package:aallithioo/src/app/themes/theme.dart';
import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:aallithioo/src/app/widgets/custom_sizebox.dart';
import 'package:aallithioo/src/screens/sign_in/widgets/sign_in_form.dart';
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
                // Description title
                Container(
                  margin: EdgeInsets.fromLTRB(0, kSizeTiny, 0, 0),
                  child: Text(
                    'Welcome back!',
                    style: tooko.textTheme.headline5!.copyWith(
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
                    style: tooko.textTheme.bodyText1!.copyWith(),
                    textAlign: kTextAlignCenter,
                  ),
                ),
                kSizeBoxHorizontalSmall,
                SignInForm(),
                kSizeBoxHorizontalSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
