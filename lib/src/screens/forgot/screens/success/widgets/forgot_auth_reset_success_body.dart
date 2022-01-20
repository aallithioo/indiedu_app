import 'package:aallithioo/src/app/routes/route.dart';
import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/themes/fontweight.dart';
import 'package:aallithioo/src/app/themes/size.dart';
import 'package:aallithioo/src/app/themes/textalign.dart';
import 'package:aallithioo/src/app/themes/theme.dart';
import 'package:aallithioo/src/app/widgets/custom_border.dart';
import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:aallithioo/src/app/widgets/custom_sizebox.dart';
import 'package:flutter/material.dart';

class ForgotAuthResetSuccessBody extends StatelessWidget {
  const ForgotAuthResetSuccessBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kPaddingSymetricHorizontalLarge,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/png/img_dummy_0.png'),
              ),
              kSizeBoxVerticalLarge,
              Container(
                margin: EdgeInsets.fromLTRB(0, kSizeTiny, 0, 0),
                child: Text(
                  'Congratulations..',
                  style: tooko.textTheme.headline5!.copyWith(
                    color: kGreyColorShade900,
                    fontWeight: kFontWeightSemiBold,
                  ),
                ),
              ),
              // Description subtitle
              Container(
                margin: EdgeInsets.fromLTRB(0, kSizeSmall, 0, kSizeLarge),
                padding: kPaddingSymetricHorizontalMedium,
                child: Text(
                  'Your account password has been changed.',
                  style: tooko.textTheme.bodyText1!.copyWith(
                    color: tooko.textTheme.bodyText1!.color!.withOpacity(0.7),
                  ),
                  textAlign: kTextAlignCenter,
                ),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: kBlueColorShade400,
                  borderRadius: kBorderRadiusTiny,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.signIn);
                  },
                  child: Text(
                    'Continue',
                    style: tooko.textTheme.button!.copyWith(
                      color: kGreyColorShade50,
                    ),
                  ),
                ),
              ),
              kSizeBoxVerticalMedium,
            ],
          ),
        ),
      ),
    );
  }
}
