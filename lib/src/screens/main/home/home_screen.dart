import 'package:aallithioo/src/app/themes/color.dart';

import '../../../app/enums.dart';

import '../../../app/widgets/custom_bottom_nav_bar.dart';

import 'widgets/home_body.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyColorShade50,
      body: const HomeBody(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
