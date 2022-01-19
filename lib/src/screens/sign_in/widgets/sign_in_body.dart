import 'package:aallithioo/src/app/no_account_text.dart';
import 'package:aallithioo/src/app/themes/fontweight.dart';
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
                kSizeBoxHorizontalSmall,
                Text(
                  'Welcome Back',
                  style: tooko.textTheme.headline4!.copyWith(
                    color: tooko.textTheme.headline4!.color,
                    fontWeight: kFontWeightBold,
                  ),
                ),
                Text(
                  'Sign in with your email and password\nor continue with social media',
                  style: tooko.textTheme.bodyText1!.copyWith(
                    color: tooko.textTheme.bodyText1!.color!.withOpacity(0.7),
                    fontWeight: kFontWeightLight,
                  ),
                  textAlign: kTextAlignCenter,
                ),
                kSizeBoxHorizontalSmall,
                SignInForm(),
                kSizeBoxHorizontalSmall,
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
