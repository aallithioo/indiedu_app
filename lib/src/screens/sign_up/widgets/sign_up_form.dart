import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/themes/fontweight.dart';
import 'package:aallithioo/src/app/themes/size.dart';
import 'package:aallithioo/src/app/themes/theme.dart';
import 'package:aallithioo/src/app/widgets/custom_border.dart';
import 'package:flutter/material.dart';

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
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
        ],
      ),
    );
  }
}
