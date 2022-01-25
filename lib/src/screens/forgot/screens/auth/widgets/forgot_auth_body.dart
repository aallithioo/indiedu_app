import '../../../../../app/routes/route.dart';

import '../../../../../app/themes/color.dart';
import '../../../../../app/themes/fontweight.dart';
import '../../../../../app/themes/size.dart';
import '../../../../../app/themes/textalign.dart';
import '../../../../../app/themes/theme.dart';

import '../../../../../app/widgets/custom_snackbar.dart';
import '../../../../../app/widgets/custom_blur.dart';
import '../../../../../app/widgets/custom_border.dart';
import '../../../../../app/widgets/custom_padding.dart';

import 'package:flutter/material.dart';

final TextEditingController tokenController = TextEditingController();
final String checkTokenController = tokenController.text.trim();
RegExp numberReg = RegExp(r'.*[0-9].*');
RegExp letterReg = RegExp(r'.*[A-Za-z].*');

class ForgotAuthBody extends StatefulWidget {
  const ForgotAuthBody({Key? key}) : super(key: key);

  @override
  State<ForgotAuthBody> createState() => _ForgotAuthBodyState();
}

class _ForgotAuthBodyState extends State<ForgotAuthBody> {
  Future err() async {
    // if (checkTokenController.isEmpty) {
    //   return ScaffoldMessenger.of(context)
    //       .showSnackBar(kSnackBar('Code is required!')!);
    // } else if (tokenController.text.length != 6 ||
    //     !numberReg.hasMatch(tokenController.text)) {
    //   return ScaffoldMessenger.of(context)
    //       .showSnackBar(kSnackBar('Code is invalid!')!);
    // } else {
    //   Navigator.pushReplacementNamed(context, Routes.reset);
    // }
    // Navigator.pushReplacementNamed(context, Routes.reset);
    if (tokenController.text.isEmpty) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Code is required!')!);
    } else if (tokenController.text.length != 6) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Code too short!')!);
    } else if (tokenController.text.contains(' ') == true) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Code is invalid!')!);
      // } else if (symbolReg.hasMatch(tokenController.text) == true) {
      //   return ScaffoldMessenger.of(context)
      //       .showSnackBar(kSnackBar('Code is required!')!);
    } else if (letterReg.hasMatch(tokenController.text) == true) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Code is invalid!')!);
    } else {
      Navigator.pushReplacementNamed(context, Routes.reset);
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
                    'Verify your account',
                    style: indiedu.textTheme.headline5!.copyWith(
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
                    'Please enter your verification code to reset password.',
                    style: indiedu.textTheme.bodyText1!.copyWith(),
                    textAlign: kTextAlignCenter,
                  ),
                ),
                // Form Field
                Form(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, kSizeSmall, 0, kSizeSmall),
                    width: double.infinity,
                    child: TextFormField(
                      controller: tokenController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kWhiteColorShade900,
                        hintText: 'Verification Code',
                        hintStyle: indiedu.textTheme.bodyText1!.copyWith(
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
                    onPressed: (checkTokenController.isEmpty &&
                            tokenController.text.length != 6)
                        ? err
                        : () {
                            Navigator.pushReplacementNamed(
                                context, Routes.reset);
                          },
                    child: Text(
                      'Verify Account',
                      style: indiedu.textTheme.button!.copyWith(
                        color: kWhiteColorShade900,
                      ),
                    ),
                  ),
                ),
                // Button
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend Verification Code',
                    style: indiedu.textTheme.button!.copyWith(
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
