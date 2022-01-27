import '../../../../../app/routes/route.dart';

import '../../../../../app/themes/color.dart';
import '../../../../../app/themes/fontweight.dart';
import '../../../../../app/themes/size.dart';
import '../../../../../app/themes/textalign.dart';
import '../../../../../app/themes/theme.dart';

import '../../../../../app/widgets/custom_border.dart';
import '../../../../../app/widgets/custom_padding.dart';
import '../../../../../app/widgets/custom_sizebox.dart';

import 'package:flutter/material.dart';

class SignInSuccessBody extends StatelessWidget {
  const SignInSuccessBody({Key? key}) : super(key: key);

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
                width: 300,
                height: 300,
                child: Image.asset('assets/images/png/img_signin_success.png'),
              ),
              kSizeBoxVerticalSmall,
              Container(
                margin: EdgeInsets.fromLTRB(0, kSizeTiny, 0, 0),
                child: Text(
                  'Hi, Folks',
                  style: indiedu.textTheme.headline5!.copyWith(
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
                  'Let\'s make new progress\nand do our best',
                  style: indiedu.textTheme.bodyText1!.copyWith(
                    color: indiedu.textTheme.bodyText1!.color!.withOpacity(0.7),
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
                    Navigator.pushReplacementNamed(context, Routes.home);
                  },
                  child: Text(
                    'Continue',
                    style: indiedu.textTheme.button!.copyWith(
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
