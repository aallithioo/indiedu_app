import '../../../app/routes/route.dart';

import '../../../app/themes/color.dart';
import '../../../app/themes/fontweight.dart';
import '../../../app/themes/size.dart';
import '../../../app/themes/textalign.dart';
import '../../../app/themes/theme.dart';

import '../../../app/widgets/custom_snackbar.dart';
import '../../../app/widgets/custom_blur.dart';
import '../../../app/widgets/custom_border.dart';
import '../../../app/widgets/custom_padding.dart';

import 'package:flutter/material.dart';

final TextEditingController emailController = TextEditingController();
final String checkEmailController = emailController.text.trim();

class ForgotBody extends StatefulWidget {
  const ForgotBody({Key? key}) : super(key: key);

  @override
  State<ForgotBody> createState() => _ForgotBodyState();
}

class _ForgotBodyState extends State<ForgotBody> {
  Future err() async {
    if (checkEmailController.isEmpty) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Email is required!')!);
    } else if (emailController.text.contains('@') == false &&
        emailController.text.contains('.') == false) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Email is invalid!')!);
    } else {
      Navigator.pushReplacementNamed(context, Routes.forgotAuth);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kPaddingSymetricHorizontalLarge,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/images/png/img_dummy_0.png'),
                ),
                // Text
                Container(
                  margin: EdgeInsets.fromLTRB(0, kSizeMedium, 0, 0),
                  child: Text(
                    'Find your account',
                    style: tooko.textTheme.headline5!.copyWith(
                      color: kGreyColorShade900,
                      fontWeight: kFontWeightSemiBold,
                    ),
                  ),
                ),
                // Description subtitle
                Container(
                  margin: EdgeInsets.fromLTRB(0, kSizeSmall, 0, kSizeSmall),
                  padding: kPaddingSymetricHorizontalMedium,
                  child: Text(
                    'Please enter your email and we will send you code.',
                    style: tooko.textTheme.bodyText1!.copyWith(),
                    textAlign: kTextAlignCenter,
                  ),
                ),
                // Form Field
                Form(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, kSizeSmall, 0, kSizeSmall),
                    width: double.infinity,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kWhiteColorShade900,
                        hintText: 'Email Address',
                        hintStyle: tooko.textTheme.bodyText1!.copyWith(
                          color: kGreyColorShade300,
                          fontWeight: kFontWeightLight,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: kBorderRadiusSmall,
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: kBorderRadiusSmall,
                          borderSide: BorderSide(
                            color: kBlueColorShade400,
                          ),
                        ),
                      ),
                      cursorColor: kBlueColorShade400,
                    ),
                  ),
                ),
                // Button
                Container(
                  margin: EdgeInsets.fromLTRB(0, kSizeSmall, 0, 0),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: kBorderRadiusSmall,
                    color: kBlueColorShade400,
                    boxShadow: [
                      BoxShadow(
                        color: kWhiteColorShade800,
                        blurRadius: kBlurRadiusHuge,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: (emailController.text == '')
                        ? err
                        : () {
                            Navigator.pushReplacementNamed(
                                context, Routes.forgotAuth);
                          },
                    child: Text(
                      'Find Account',
                      style: tooko.textTheme.button!.copyWith(
                        color: kWhiteColorShade900,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.signIn);
                  },
                  child: Text(
                    'Back to Sign In',
                    style: tooko.textTheme.button!.copyWith(
                      color: kBlueColorShade400,
                    ),
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
