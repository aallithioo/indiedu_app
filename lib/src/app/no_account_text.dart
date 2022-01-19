import 'package:aallithioo/src/app/routes/route.dart';
import 'themes/color.dart';
import 'package:flutter/material.dart';

import 'themes/size.dart';
import 'themes/theme.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: tooko.textTheme.bodyText1,
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.signUp),
          child: Text(
            "Sign Up",
            style: tooko.textTheme.bodyText1!.copyWith(
              color: kBlueColorShade400,
            ),
          ),
        ),
      ],
    );
  }
}
