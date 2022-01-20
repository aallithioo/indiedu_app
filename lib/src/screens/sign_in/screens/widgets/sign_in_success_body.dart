import 'package:aallithioo/src/app/widgets/custom_padding.dart';
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
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/png/img_dummy_0.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
