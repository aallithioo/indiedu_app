import '../../../../data/provider/provider.dart';

import '../../../../app/routes/route.dart';

import '../../../../app/widgets/custom_padding.dart';
import '../../../../app/widgets/custom_sizebox.dart';
import '../../../../app/widgets/custom_snackbar.dart';

import 'profile_pic.dart';
import 'profile_menu.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(
    //   context,
    //   // listen: false,
    // );

    // Future<String> kWhoAmI() async {
    //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    //   User? user = firebaseAuth.currentUser;
    //   final uri = user!.photoURL.toString();
    //   return uri;
    // }

    return SafeArea(
      child: Padding(
        padding: kPaddingSymetricVerticalLarge,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                kSizeBoxVerticalMedium,
                const ProfilePic(),
                const SizedBox(height: 20),
                // Text(
                //   kWhoAmI().toString() == '' ? 'No Name' : kWhoAmI().toString(),
                //   style: Theme.of(context).textTheme.headline6,
                // ),
                const SizedBox(height: 20),
                ProfileMenu(
                  text: "My Account",
                  icon: "assets/icons/svg/User Icon.svg",
                  press: () => ScaffoldMessenger.of(context).showSnackBar(
                    kSnackBar(
                      'Feature are not available yet!',
                    )!,
                  ),
                ),
                ProfileMenu(
                  text: "Notifications",
                  icon: "assets/icons/svg/Bell.svg",
                  press: () => ScaffoldMessenger.of(context).showSnackBar(
                    kSnackBar(
                      'Feature are not available yet!',
                    )!,
                  ),
                ),
                ProfileMenu(
                  text: "Settings",
                  icon: "assets/icons/svg/Settings.svg",
                  press: () => ScaffoldMessenger.of(context).showSnackBar(
                    kSnackBar(
                      'Feature are not available yet!',
                    )!,
                  ),
                ),
                ProfileMenu(
                  text: "Help Center",
                  icon: "assets/icons/svg/Question mark.svg",
                  press: () => ScaffoldMessenger.of(context).showSnackBar(
                    kSnackBar(
                      'Feature are not available yet!',
                    )!,
                  ),
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: "assets/icons/svg/Log out.svg",
                  press: () {
                    AuthProvider authProvider = Provider.of<AuthProvider>(
                      context,
                      listen: false,
                    );

                    FirebaseAuth.instance.signOut();
                    authProvider.removeToken();
                    GoogleSignIn().signOut();
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.signIn,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
