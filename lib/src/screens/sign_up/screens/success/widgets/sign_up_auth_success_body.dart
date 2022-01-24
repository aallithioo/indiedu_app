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

class SignUpAuthSuccessBody extends StatelessWidget {
  const SignUpAuthSuccessBody({Key? key}) : super(key: key);

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
                  'Huuraayyyy!',
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
                  'Welcome to be part of our family. We hope you have what you need and what you want and make your dream come true',
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
                    Navigator.pushReplacementNamed(context, Routes.signIn);
                  },
                  child: Text(
                    'Sign In Now',
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
