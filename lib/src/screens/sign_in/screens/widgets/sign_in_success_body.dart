import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/themes/theme.dart';
import 'package:aallithioo/src/app/widgets/custom_border.dart';
import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:aallithioo/src/app/widgets/custom_sizebox.dart';
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
                width: 200,
                height: 200,
                child: Image.asset('assets/images/png/img_dummy_0.png'),
              ),
              kSizeBoxVerticalLarge,
              Text(
                'Sign in success',
                style: tooko.textTheme.bodyText1,
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
                  onPressed: () {},
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
