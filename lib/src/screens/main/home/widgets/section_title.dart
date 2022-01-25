import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/widgets/custom_snackbar.dart';

import '../../../../app/themes/theme.dart';

import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: indiedu.textTheme.bodyText1!.copyWith(
            color: indiedu.textTheme.bodyText1!.color,
          ),
        ),
        GestureDetector(
          onTap: () => ScaffoldMessenger.of(context)
              .showSnackBar(kSnackBar('Feature are not available yet!')!),
          child: Text(
            "See More",
            style: indiedu.textTheme.bodyText2!.copyWith(
              color: kGreyColorShade400,
            ),
          ),
        )
      ],
    );
  }
}
