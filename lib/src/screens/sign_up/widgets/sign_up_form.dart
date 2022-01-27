import 'package:aallithioo/src/data/provider/provider.dart';
import 'package:provider/provider.dart';

import '../../../app/routes/route.dart';

import '../../../app/themes/color.dart';
import '../../../app/themes/fontweight.dart';
import '../../../app/themes/size.dart';
import '../../../app/themes/theme.dart';

import '../../../app/widgets/custom_blur.dart';
import '../../../app/widgets/custom_border.dart';
import '../../../app/widgets/custom_padding.dart';
import '../../../app/widgets/custom_sizebox.dart';
import '../../../app/widgets/custom_snackbar.dart';

import "package:firebase_auth/firebase_auth.dart";
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
final TextEditingController phoneController = TextEditingController();
late String password;
late String checkPhoneController = phoneController.text.trim();
final TextEditingController passwordConfirmController = TextEditingController();
late String checkPasswordController = passwordController.text.trim();
late String checkPasswordConfirmController =
    passwordConfirmController.text.trim();
final TextEditingController passwordController = TextEditingController();

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  late String checkNameController = nameController.text.trim();
  late String checkEmailController = emailController.text.trim();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static bool isObscured = true;

  Future err() async {
    if (nameController.text.isEmpty) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Name is required!')!);
    } else if (nameController.text.length < 3) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Name too short!')!);
    } else if (nameController.text.length > 16) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Name too long!')!);
    } else if (nameController.text.contains(' ') == true) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Name is invalid!')!);
    } else if (numberReg.hasMatch(nameController.text) == true) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Name is invalid!')!);
    } else if (emailController.text.isEmpty) {
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
    } else if (passwordConfirmController.text != passwordController.text) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('Password not match!')!);
    } else if (isChecked == false) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(kSnackBar('You need to agree the terms')!);
    } else {
      AuthProvider authProvider = Provider.of<AuthProvider>(
        context,
        listen: false,
      );
      bool? isValid = await authProvider.register(
        nameController.text,
        emailController.text,
        passwordController.text,
      );

      if (isValid == true) {
        Navigator.pushReplacementNamed(context, Routes.signUpSuccess);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          kSnackBar(
            'Something wrong or Email have been taken!',
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
                      style: indiedu.textTheme.bodyText1!.copyWith(
                        color: kGreyColorShade500,
                        fontSize: kSizeSmall - 4,
                        fontWeight: kFontWeightLight,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Terms of Service',
                        style: indiedu.textTheme.bodyText1!.copyWith(
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
                onPressed: err,
                // onPressed: (checkNameController.isNotEmpty &&
                //             numberReg.hasMatch(checkNameController)) &&
                //         checkEmailController.isNotEmpty &&
                //         (checkPasswordController.isNotEmpty &&
                //             numberReg.hasMatch(checkPasswordController) &&
                //             letterReg.hasMatch(checkPasswordController) &&
                //             (checkPasswordController.length <= 8)) &&
                //         checkPasswordConfirmController.isNotEmpty &&
                //         (passwordConfirmController.text ==
                //             passwordController.text) &&
                //         isChecked == true
                //     ? () {
                //         Navigator.pushReplacementNamed(
                //             context, Routes.signUpAuth);
                //       }
                //     : err,
                child: Text(
                  'Join Now',
                  style: indiedu.textTheme.button!.copyWith(
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
                  style: indiedu.textTheme.button!.copyWith(
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
                    style: indiedu.textTheme.button!.copyWith(
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
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.signInSuccess,
                  );
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
