import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:aallithioo/src/screens/main/home/widgets/icon_with_counter.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingSymetricHorizontalMedium,
      child: Row(
        children: [
          // TODO: Add search bar
          // TODO: Add Icon
          IconButtonWithCounter(
            svgSrc: "assets/icons/svg/Cart Icon.svg",
            press: () {},
          ),
          // TODO: Add Icon
          IconButtonWithCounter(
            svgSrc: "assets/icons/svg/Bell.svg",
            press: () {},
          )
        ],
      ),
    );
  }
}
