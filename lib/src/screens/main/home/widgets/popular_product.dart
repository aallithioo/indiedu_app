import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:aallithioo/src/screens/main/home/widgets/section_title.dart';
import 'package:flutter/material.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: kPaddingSymetricHorizontalMedium,
          child: SectionTitle(
            title: "Popular Course",
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
