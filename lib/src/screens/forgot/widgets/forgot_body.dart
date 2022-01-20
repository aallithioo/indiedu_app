import 'package:aallithioo/src/app/routes/route.dart';
import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/themes/fontweight.dart';
import 'package:aallithioo/src/app/themes/size.dart';
import 'package:aallithioo/src/app/themes/textalign.dart';
import 'package:aallithioo/src/app/themes/theme.dart';
import 'package:aallithioo/src/app/widgets/custom_blur.dart';
import 'package:aallithioo/src/app/widgets/custom_border.dart';
import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

final TextEditingController emailController = TextEditingController();

class ForgotBody extends StatelessWidget {
  const ForgotBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kPaddingSymetricHorizontalLarge,
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
                'Find your account',
                style: tooko.textTheme.headline5!.copyWith(
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
                'Please enter your email and we will send you code.',
                style: tooko.textTheme.bodyText1!.copyWith(),
                textAlign: kTextAlignCenter,
              ),
            ),
            // Form Field
            Form(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, kSizeSmall, 0, kSizeSmall),
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
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.forgotAuth);
                },
                child: Text(
                  'Find Account',
                  style: tooko.textTheme.button!.copyWith(
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
                style: tooko.textTheme.button!.copyWith(
                  color: kBlueColorShade400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
