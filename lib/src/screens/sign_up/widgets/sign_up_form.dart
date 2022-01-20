import 'package:aallithioo/src/app/routes/route.dart';
import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/themes/fontweight.dart';
import 'package:aallithioo/src/app/themes/size.dart';
import 'package:aallithioo/src/app/themes/theme.dart';
import 'package:aallithioo/src/app/widgets/custom_blur.dart';
import 'package:aallithioo/src/app/widgets/custom_border.dart';
import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:aallithioo/src/app/widgets/custom_sizebox.dart';
import 'package:aallithioo/src/app/widgets/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

bool isChecked = false;
bool? isMatch;
double passwordStrength = 0.0;
String? passwordHint;
var requiredData = const Text(' *', style: TextStyle(color: Colors.red));
RegExp numberReg = RegExp(r'.*[0-9].*');
RegExp letterReg = RegExp(r'.*[A-Za-z].*');
final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController passwordConfirmController = TextEditingController();
late String password;
late String checkNameController = nameController.text.trim();
late String checkEmailController = emailController.text.trim();
late String checkPhoneController = phoneController.text.trim();
late String checkPasswordController = passwordController.text.trim();
late String checkPasswordConfirmController =
    passwordConfirmController.text.trim();

class _SignUpFormState extends State<SignUpForm> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static bool isObscured = true;

  Future err() async {
    if (nameController.text == "" || nameController.text.length <= 4) {
      if (numberReg.hasMatch(checkNameController)) {
        return ScaffoldMessenger.of(context).showSnackBar(
            kSnackBar('Name must be atleast than 4 characters!')!);
      } else {
        return ScaffoldMessenger.of(context)
            .showSnackBar(kSnackBar('Name is required!')!);
      }
    } else if (emailController.text == "") {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Address is required!')!);
    } else if (passwordController.text == "") {
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
    } else if (isChecked == false) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('You need to agree the terms')!);
    } else {
      Navigator.pushReplacementNamed(context, Routes.signUpAuth);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Third party login
            buildThirdPartyButton(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Container(
                  margin: EdgeInsets.fromLTRB(0, kSizeSmall, 0, 0),
                  width: double.infinity,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kWhiteColorShade900,
                      hintText: 'Name',
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
                      prefixIcon: Icon(
                        Icons.person_rounded,
                        color: kGreyColorShade400,
                      ),
                    ),
                    cursorColor: kBlueColorShade400,
                  ),
                ),
                // Email
                Container(
                  margin: EdgeInsets.fromLTRB(0, kSizeSmall, 0, 0),
                  width: double.infinity,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: kGreyColorShade400,
                      ),
                    ),
                    cursorColor: kBlueColorShade400,
                  ),
                ),
                // Password
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
                          isObscured ? Icons.visibility : Icons.visibility_off,
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
                          isObscured ? Icons.visibility : Icons.visibility_off,
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
            kSizeBoxVerticalSmall,
            // Checkbox
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: isChecked,
                  checkColor: kGreyColorShade50,
                  side: BorderSide(
                    color: kGreyColorShade400,
                  ),
                  fillColor: MaterialStateProperty.all(kBlueColorShade400),
                  onChanged: (value) {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                ),
                Row(
                  children: [
                    Text(
                      'I agree to the',
                      style: tooko.textTheme.bodyText1!.copyWith(
                        color: kGreyColorShade500,
                        fontSize: kSizeSmall - 4,
                        fontWeight: kFontWeightLight,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Terms of Service',
                        style: tooko.textTheme.bodyText1!.copyWith(
                          color: kBlueColorShade400,
                          fontSize: kSizeSmall - 4,
                          fontWeight: kFontWeightLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
                onPressed: (checkNameController.isNotEmpty &&
                            numberReg.hasMatch(checkNameController)) &&
                        checkEmailController.isNotEmpty &&
                        (checkPasswordController.isNotEmpty &&
                            numberReg.hasMatch(checkPasswordController) &&
                            letterReg.hasMatch(checkPasswordController) &&
                            (checkPasswordController.length <= 8)) &&
                        checkPasswordConfirmController.isNotEmpty &&
                        (passwordConfirmController.text ==
                            passwordController.text) &&
                        isChecked == true
                    ? () {
                        Navigator.pushReplacementNamed(
                            context, Routes.signUpAuth);
                      }
                    : err,
                child: Text(
                  'Join Now',
                  style: tooko.textTheme.button!.copyWith(
                    color: kWhiteColorShade900,
                  ),
                ),
              ),
            ),
            // Option to create an account or forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Forgot password
                Text(
                  'Have an account? ',
                  style: tooko.textTheme.button!.copyWith(
                    fontSize: 12,
                    fontWeight: kFontWeightLight,
                  ),
                ),
                // Sign up
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.signIn);
                  },
                  child: Text(
                    'Sign In',
                    style: tooko.textTheme.button!.copyWith(
                      color: kBlueColorShade500,
                      fontSize: 12,
                      fontWeight: kFontWeightLight,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildThirdPartyButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Sign in with Google
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: kBorderRadiusSmall,
            color: kWhiteColorShade900,
            boxShadow: [
              BoxShadow(
                color: kWhiteColorShade800,
                blurRadius: kBlurRadiusHuge,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: kPaddingAllMedium,
            child: TextButton(
              onPressed: () async {
                final GoogleSignInAccount? googleUser =
                    await GoogleSignIn().signIn();

                final GoogleSignInAuthentication? googleAuth =
                    await googleUser?.authentication;

                final credential = GoogleAuthProvider.credential(
                  accessToken: googleAuth?.accessToken,
                  idToken: googleAuth?.idToken,
                );

                FirebaseAuth.instance.signInWithCredential(credential);

                if (credential.accessToken != null &&
                    credential.idToken != null) {
                  // Navigator.pushReplacementNamed(
                  //   context,
                  //   Routes.controller,
                  // );
                }
              },
              child: Image.asset('assets/images/png/img_google_logo.png'),
            ),
          ),
        ),
        // Sign in with Apple
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: kBorderRadiusSmall,
            color: kWhiteColorShade900,
            boxShadow: [
              BoxShadow(
                color: kWhiteColorShade800,
                blurRadius: kBlurRadiusHuge,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: TextButton(
            onPressed: () => ScaffoldMessenger.of(context)
                .showSnackBar(kSnackBar('Kata sandi tidak boleh kosong!')!),
            child: Padding(
              padding: kPaddingAllMedium,
              child: Image.asset('assets/images/png/img_apple_logo.png'),
            ),
          ),
        ),
      ],
    );
  }
}
