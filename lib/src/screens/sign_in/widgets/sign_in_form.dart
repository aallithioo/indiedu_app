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

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static bool isObscured = true;
  final List<String?> errors = [];

  // Add error messages to the errors list
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  // Remove error messages from the errors list
  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // KeyboardUtil.hideKeyboard(context);
                    Navigator.pushReplacementNamed(
                        context, Routes.signInSuccess);
                  }
                },
                child: Text(
                  'Let\'s Go',
                  style: tooko.textTheme.button!.copyWith(
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
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: tooko.textTheme.button!.copyWith(
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
                    style: tooko.textTheme.button!.copyWith(
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

  // Container(
  //   width: MediaQuery.of(context).size.width,
  //   height: 60,
  //   decoration: BoxDecoration(
  //     color: kBlueColorShade400,
  //     borderRadius: kBorderRadiusTiny,
  //   ),
  //   child: TextButton(
  //     onPressed: () {
  //       if (_formKey.currentState!.validate()) {
  //         _formKey.currentState!.save();
  //         // KeyboardUtil.hideKeyboard(context);
  //         Navigator.pushReplacementNamed(context, Routes.signInSuccess);
  //       }
  //     },
  //     child: Text(
  //       'Continue',
  //       style: tooko.textTheme.button!.copyWith(
  //         color: kGreyColorShade50,
  //       ),
  //     ),
  //   ),
  // ),
  // ------------------------------------------------------------

//   TextFormField buildEmailFormField() {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       onSaved: (newValue) => _emailController = newValue,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kEmailNullError);
//         } else if (emailValidatorRegExp.hasMatch(value)) {
//           addError(error: kInvalidEmailError);
//         }
//         return;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kEmailNullError);
//           return "";
//         } else if (!emailValidatorRegExp.hasMatch(value)) {
//           addError(error: kInvalidEmailError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         hintText: 'Email Address',
//         hintStyle: tooko.textTheme.bodyText2!.copyWith(
//           color: kGreyColorShade400,
//         ),
//         errorText: errors.contains(kEmailNullError) ? kEmailNullError : null,
//         errorStyle: TextStyle(color: kErrorColor),
//         filled: true,
//         fillColor: kGreyColorShade200,
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         border: OutlineInputBorder(
//           borderRadius: kBorderRadiusTiny,
//           borderSide: BorderSide.none,
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: kBorderRadiusTiny,
//           borderSide: BorderSide(
//             color: kBlueColorShade400,
//           ),
//         ),
//         prefixIcon: Icon(
//           Icons.email_rounded,
//           color: kGreyColorShade400,
//         ),
//       ),
//     );
//   }

//   TextFormField buildPasswordFormField() {
//     return TextFormField(
//       obscureText: isObscured,
//       onSaved: (newValue) => _passwordController = newValue,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kPassNullError);
//         } else if (value.length >= 8) {
//           addError(error: kShortPassError);
//         }
//         return;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kPassNullError);
//           return "";
//         } else if (value.length < 8) {
//           addError(error: kShortPassError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         hintText: 'Password',
//         hintStyle: tooko.textTheme.bodyText2!.copyWith(
//           color: kGreyColorShade400,
//         ),
//         errorText: errors.contains(kPassNullError) ? kPassNullError : null,
//         errorStyle: TextStyle(color: kErrorColor),
//         filled: true,
//         fillColor: kGreyColorShade200,
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         border: OutlineInputBorder(
//           borderRadius: kBorderRadiusTiny,
//           borderSide: BorderSide.none,
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: kBorderRadiusTiny,
//           borderSide: BorderSide(
//             color: kBlueColorShade400,
//           ),
//         ),
//         prefixIcon: Icon(
//           Icons.vpn_key_rounded,
//           color: kGreyColorShade400,
//         ),
//         suffixIcon: IconButton(
//           color: kGreyColorShade400,
//           icon: Icon(
//             isObscured ? Icons.visibility : Icons.visibility_off,
//           ),
//           onPressed: () {
//             setState(
//               () {
//                 isObscured = !isObscured;
//               },
//             );
//           },
//         ),
//       ),
//       cursorColor: kBlueColorShade400,
//     );
//   }
// }

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
          child: Padding(
            padding: kPaddingAllMedium,
            child: Image.asset('assets/images/png/img_apple_logo.png'),
          ),
        ),
      ],
    );
  }
}