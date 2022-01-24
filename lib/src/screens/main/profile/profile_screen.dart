import 'package:aallithioo/src/app/enums.dart';
import 'package:aallithioo/src/app/widgets/custom_appbar.dart';
import 'package:aallithioo/src/app/widgets/custom_bottom_nav_bar.dart';
import 'package:aallithioo/src/screens/main/profile/widgets/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar('Profile'),
      body: ProfileBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
