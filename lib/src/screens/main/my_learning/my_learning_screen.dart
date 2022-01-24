import 'package:aallithioo/src/app/enums.dart';
import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/themes/fontweight.dart';
import 'package:aallithioo/src/app/themes/size.dart';
import 'package:aallithioo/src/app/themes/theme.dart';
import 'package:aallithioo/src/app/widgets/custom_appbar.dart';
import 'package:aallithioo/src/app/widgets/custom_bottom_nav_bar.dart';
import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:aallithioo/src/app/widgets/custom_sizebox.dart';
import 'package:flutter/material.dart';

class MyLearningScreen extends StatelessWidget {
  const MyLearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColorShade900,
      appBar: kAppBar('My Learning'),
      body: SafeArea(
        child: Padding(
          padding: kPaddingSymetricHorizontalLarge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/png/img_no_course.png'),
              Text(
                'You have no course',
                style: tooko.textTheme.headline6!.copyWith(
                  fontSize: kSizeMedium,
                  fontWeight: kFontWeightSemiBold,
                ),
              ),
              kSizeBoxVerticalSmall,
              Text(
                'Wake up and let\'s make new progress..',
                style: tooko.textTheme.bodyText1!.copyWith(
                  fontSize: 14,
                  fontWeight: kFontWeightLight,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.myLearning),
    );
  }
}
