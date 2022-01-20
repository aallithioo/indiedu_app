import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/themes/fontweight.dart';
import 'package:aallithioo/src/app/themes/size.dart';
import 'package:aallithioo/src/app/themes/theme.dart';
import 'package:aallithioo/src/app/widgets/custom_blur.dart';
import 'package:aallithioo/src/app/widgets/custom_border.dart';
import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static bool isObscured = true;

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
            // Name
            Container(
              margin: EdgeInsets.fromLTRB(0, kSizeSmall, 0, 0),
              width: double.infinity,
              child: TextFormField(
                controller: emailController,
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
                controller: passwordController,
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
            // Button
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
