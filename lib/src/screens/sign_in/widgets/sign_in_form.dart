import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/provider/provider.dart';

import '../../../app/widgets/custom_snackbar.dart';
import '../../../app/widgets/custom_blur.dart';
import '../../../app/widgets/custom_padding.dart';
import '../../../app/widgets/custom_border.dart';

import '../../../app/routes/route.dart';

import '../../../app/themes/fontweight.dart';
import '../../../app/themes/size.dart';
import '../../../app/themes/theme.dart';
import '../../../app/themes/color.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegExp numberReg = RegExp(r'.*[0-9].*');
  RegExp letterReg = RegExp(r'.*[A-Za-z].*');
  static bool isObscured = true;

  Future err() async {
    if (emailController.text.isEmpty) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Email is required!')!);
    } else if (emailController.text.length < 5) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Email too short!')!);
    } else if (emailController.text.length > 64) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Email too long!')!);
    } else if (emailController.text.contains('@') == false) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Email is invalid!')!);
    } else if (emailController.text.contains('.') == false) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Email is invalid!')!);
    } else if (emailController.text.contains(' ') == true) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Email is invalid!')!);
    } else if (passwordController.text.isEmpty) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Password is required!')!);
    } else if (passwordController.text.length < 8) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Password too short!')!);
    } else if (passwordController.text.length > 64) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Password too long!')!);
    } else if (numberReg.hasMatch(passwordController.text) == false) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Password must contains number!')!);
    } else if (letterReg.hasMatch(passwordController.text) == false) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Password must contains letter!')!);
    } else {
      AuthProvider authProvider = Provider.of<AuthProvider>(
        context,
        listen: false,
      );
      bool? isValid = await authProvider.login(
        emailController.text,
        passwordController.text,
      );

      if (isValid == true) {
        Navigator.pushReplacementNamed(context, Routes.signInSuccess);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          kSnackBar(
            'Wrong email or password!',
          )!,
        );
      }
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
            // Sign in with third party
            buildThirdPartyButton(),

            // Sign in with email
            Column(
              children: [
                // Email Input
                Container(
                  margin: EdgeInsets.fromLTRB(0, kSizeSmall, 0, 0),
                  width: double.infinity,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kWhiteColorShade900,
                      hintText: 'Email Address',
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
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: kGreyColorShade400,
                      ),
                    ),
                    cursorColor: kBlueColorShade400,
                  ),
                ),
                // Password Input
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
            // Sign in button
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
                onPressed: err,
                child: Text(
                  'Let\'s Go',
                  style: indiedu.textTheme.button!.copyWith(
                    color: kWhiteColorShade900,
                  ),
                ),
              ),
            ),
            // Option to create an account or forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Forgot password
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.forgot);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: indiedu.textTheme.button!.copyWith(
                      color: kBlueColorShade400,
                      fontSize: 12,
                      fontWeight: kFontWeightLight,
                    ),
                  ),
                ),
                // Sign up
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.signUp);
                  },
                  child: Text(
                    'Create Account',
                    style: indiedu.textTheme.button!.copyWith(
                      color: kBlueColorShade400,
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

                saveTokenGoogle(String token) async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('accessToken', credential.accessToken!);
                }

                // sign in logic
                if (credential.accessToken != null &&
                    credential.idToken != null) {
                  saveTokenGoogle(credential.accessToken!);
                  Navigator.pushNamed(context, Routes.signInSuccess);
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
