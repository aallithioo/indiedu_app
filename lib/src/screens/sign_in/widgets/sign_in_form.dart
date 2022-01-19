import '../../../app/routes/route.dart';

import '../../../app/themes/size.dart';
import '../../../app/themes/theme.dart';

import '../../../app/widgets/custom_border.dart';
import '../../../app/widgets/custom_sizebox.dart';
import '../../../app/widgets/custom_suffix_icon.dart';

import '../../../app/form_error.dart';
import '../../../app/constants.dart';

import '../../../app/themes/color.dart';

import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _emailController;
  String? _passwordController;
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: kSizeTiny),
          buildPasswordFormField(),
          SizedBox(height: kSizeTiny),
          FormError(errors: errors),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
              color: kBlueColorShade400,
              borderRadius: kBorderRadiusTiny,
            ),
            child: TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // KeyboardUtil.hideKeyboard(context);
                  Navigator.pushReplacementNamed(context, Routes.signInSuccess);
                }
              },
              child: Text(
                'Continue',
                style: tooko.textTheme.button!.copyWith(
                  color: kGreyColorShade50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => _emailController = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Email Address',
        hintStyle: tooko.textTheme.bodyText2!.copyWith(
          color: kGreyColorShade400,
        ),
        errorText: errors.contains(kEmailNullError) ? kEmailNullError : null,
        errorStyle: TextStyle(color: kErrorColor),
        filled: true,
        fillColor: kGreyColorShade200,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: kBorderRadiusTiny,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: kBorderRadiusTiny,
          borderSide: BorderSide(
            color: kBlueColorShade400,
          ),
        ),
        prefixIcon: Icon(
          Icons.email_rounded,
          color: kGreyColorShade400,
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => _passwordController = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          addError(error: kShortPassError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: tooko.textTheme.bodyText2!.copyWith(
          color: kGreyColorShade400,
        ),
        errorText: errors.contains(kPassNullError) ? kPassNullError : null,
        errorStyle: TextStyle(color: kErrorColor),
        filled: true,
        fillColor: kGreyColorShade200,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: kBorderRadiusTiny,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: kBorderRadiusTiny,
          borderSide: BorderSide(
            color: kBlueColorShade400,
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
      cursorColor: kBlueColorShade400,
    );
  }
}
