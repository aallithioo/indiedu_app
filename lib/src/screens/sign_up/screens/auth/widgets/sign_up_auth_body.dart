import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/themes/fontweight.dart';
import 'package:aallithioo/src/app/themes/size.dart';
import 'package:aallithioo/src/app/themes/theme.dart';
import 'package:aallithioo/src/app/widgets/custom_border.dart';
import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class SignUpAuthBody extends StatefulWidget {
  const SignUpAuthBody({Key? key}) : super(key: key);

  @override
  State<SignUpAuthBody> createState() => _SignUpAuthBodyState();
}

class _SignUpAuthBodyState extends State<SignUpAuthBody> {
  final TextEditingController tokenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kPaddingSymetricHorizontalLarge,
        child: Column(
          children: [
            // Image
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/png/img_dummy_0.png'),
            ),
            // Form Field
            Form(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, kSizeSmall, 0, 0),
                width: double.infinity,
                child: TextFormField(
                  controller: tokenController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kWhiteColorShade900,
                    hintText: 'Verification Code',
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
            // Button
          ],
        ),
      ),
    );
  }
}
