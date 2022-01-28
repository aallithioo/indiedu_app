import '../../../app/enums.dart';

import '../../../app/widgets/custom_appbar.dart';
import '../../../app/widgets/custom_bottom_nav_bar.dart';

import 'widgets/profile_body.dart';

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar('Profile'),
      body: const ProfileBody(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
