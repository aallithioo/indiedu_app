import 'package:aallithioo/src/app/themes/theme.dart';
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
      children: [
        Text(
          title,
          style: tooko.textTheme.bodyText1!.copyWith(
            color: tooko.textTheme.bodyText1!.color,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "See More",
            style: tooko.textTheme.bodyText1!.copyWith(
              color: tooko.textTheme.bodyText1!.color!.withOpacity(0.7),
            ),
          ),
        )
      ],
    );
  }
}
