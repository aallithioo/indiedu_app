import '../../../../app/widgets/custom_padding.dart';
import '../../../../app/widgets/custom_sizebox.dart';
import '../../../../app/widgets/custom_snackbar.dart';
import 'profile_pic.dart';
import 'package:flutter/material.dart';

import 'profile_menu.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kPaddingSymetricVerticalLarge,
        child: Center(
          child: Column(
            children: [
              kSizeBoxVerticalMedium,
              ProfilePic(),
              SizedBox(height: 20),
              ProfileMenu(
                text: "My Account",
                icon: "assets/icons/User Icon.svg",
                press: () => ScaffoldMessenger.of(context)
                    .showSnackBar(kSnackBar('Feature are not available yet!')!),
              ),
              ProfileMenu(
                text: "Notifications",
                icon: "assets/icons/Bell.svg",
                press: () => ScaffoldMessenger.of(context)
                    .showSnackBar(kSnackBar('Feature are not available yet!')!),
              ),
              ProfileMenu(
                text: "Settings",
                icon: "assets/icons/Settings.svg",
                press: () => ScaffoldMessenger.of(context)
                    .showSnackBar(kSnackBar('Feature are not available yet!')!),
              ),
              ProfileMenu(
                text: "Help Center",
                icon: "assets/icons/Question mark.svg",
                press: () => ScaffoldMessenger.of(context)
                    .showSnackBar(kSnackBar('Feature are not available yet!')!),
              ),
              ProfileMenu(
                text: "Log Out",
                icon: "assets/icons/Log out.svg",
                press: () => ScaffoldMessenger.of(context)
                    .showSnackBar(kSnackBar('Feature are not available yet!')!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
