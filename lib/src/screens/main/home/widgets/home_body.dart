import 'package:aallithioo/src/app/themes/size.dart';
import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:aallithioo/src/screens/main/home/widgets/home_header.dart';
import 'package:aallithioo/src/screens/main/home/widgets/popular_product.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kPaddingSymetricHorizontalLarge,
          child: Column(
            children: [
              SizedBox(height: kSizeMedium),
              HomeHeader(),
              SizedBox(height: kSizeMedium),
              PopularProduct(),
              SizedBox(height: kSizeMedium),
            ],
          ),
        ),
      ),
    );
  }
}
