import '../../../../../app/routes/route.dart';
import '../../../../../app/themes/color.dart';
import '../../../../../app/themes/fontweight.dart';
import '../../../../../app/themes/size.dart';
import '../../../../../app/themes/textalign.dart';
import '../../../../../app/themes/theme.dart';
import '../../../../../app/widgets/custom_blur.dart';
import '../../../../../app/widgets/custom_border.dart';
import '../../../../../app/widgets/custom_padding.dart';
import '../../../../../app/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';

class ForgotAuthResetBody extends StatefulWidget {
  const ForgotAuthResetBody({Key? key}) : super(key: key);

  @override
  State<ForgotAuthResetBody> createState() => _ForgotAuthResetBodyState();
}

class _ForgotAuthResetBodyState extends State<ForgotAuthResetBody> {
  bool? isMatch;
  var requiredData = const Text(' *', style: TextStyle(color: Colors.red));
  RegExp numberReg = RegExp(r'.*[0-9].*');
  RegExp letterReg = RegExp(r'.*[A-Za-z].*');
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  late String checkPasswordController = passwordController.text.trim();
  late String checkPasswordConfirmController =
      passwordConfirmController.text.trim();
  static bool isObscured = true;

  Future err() async {
    if (passwordController.text == "") {
      if (checkPasswordController.isEmpty) {
        return ScaffoldMessenger.of(context)
            .showSnackBar(kSnackBar('Password is required!')!);
      } else if (checkPasswordController.length <= 8) {
        return ScaffoldMessenger.of(context)
            .showSnackBar(kSnackBar('Password must be atleast 8 characters!')!);
      } else if (numberReg.hasMatch(checkPasswordController)) {
        return ScaffoldMessenger.of(context)
            .showSnackBar(kSnackBar('Password must be contain number!')!);
      } else if (letterReg.hasMatch(checkPasswordController)) {
        return ScaffoldMessenger.of(context)
            .showSnackBar(kSnackBar('Password must be contain letter!')!);
      } else {
        return ScaffoldMessenger.of(context).showSnackBar(
            kSnackBar('Password must be contain number and letter!')!);
      }
    } else if (passwordConfirmController.text == "" &&
        passwordConfirmController.text != passwordController.text) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Password is required!')!);
    } else {
      Navigator.pushReplacementNamed(context, Routes.resetSuccess);
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
                    'Chage Password',
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
                    'Don\'t let anyone knows your password and please to use strong.',
                    style: indiedu.textTheme.bodyText1!.copyWith(),
                    textAlign: kTextAlignCenter,
                  ),
                ),
                // Form Field
                Form(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, kSizeSmall, 0, 0),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          obscureText: isObscured,
                          obscuringCharacter: '•',
                          controller: passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: kWhiteColorShade900,
                            hintText: 'Password',
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
                                color: kBlueColorShade500,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key_rounded,
                              color: kGreyColorShade400,
                            ),
                            suffixIcon: IconButton(
                              color: kGreyColorShade400,
                              icon: Icon(
                                isObscured
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    isObscured = !isObscured;
                                  },
                                );
                              },
                            ),
                          ),
                          cursorColor: kBlueColorShade500,
                        ),
                      ),
                      // Confirm Password
                      Container(
                        margin: EdgeInsets.fromLTRB(0, kSizeSmall, 0, 0),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          obscureText: isObscured,
                          obscuringCharacter: '•',
                          controller: passwordConfirmController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: kWhiteColorShade900,
                            hintText: 'Retype Password',
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
                                color: kBlueColorShade500,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key_rounded,
                              color: kGreyColorShade400,
                            ),
                            suffixIcon: IconButton(
                              color: kGreyColorShade400,
                              icon: Icon(
                                isObscured
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    isObscured = !isObscured;
                                  },
                                );
                              },
                            ),
                          ),
                          cursorColor: kBlueColorShade500,
                        ),
                      ),
                    ],
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
                    onPressed: (passwordController.text != "" &&
                            passwordConfirmController.text != "" &&
                            passwordController.text ==
                                passwordConfirmController.text &&
                            checkPasswordController.length > 8)
                        ? () {
                            Navigator.pushReplacementNamed(
                                context, Routes.resetSuccess);
                          }
                        : err,
                    child: Text(
                      'Change Password',
                      style: indiedu.textTheme.button!.copyWith(
                        color: kWhiteColorShade900,
                      ),
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
