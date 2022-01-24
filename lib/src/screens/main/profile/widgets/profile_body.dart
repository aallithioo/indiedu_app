import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:aallithioo/src/app/widgets/custom_sizebox.dart';
import 'package:aallithioo/src/screens/main/profile/widgets/profile_pic.dart';
import 'package:flutter/material.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
