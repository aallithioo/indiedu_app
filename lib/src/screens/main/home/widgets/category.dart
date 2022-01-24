import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/themes/size.dart';
import 'package:aallithioo/src/app/widgets/custom_border.dart';
import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:aallithioo/src/app/widgets/custom_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];

    return Padding(
      padding: kPaddingAllSmall,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CatergoryCardItem(
            icon: categories[index]['icon'],
            text: categories[index]['text'],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CatergoryCardItem extends StatelessWidget {
  const CatergoryCardItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: kSizeLarge,
        child: Column(
          children: [
            Container(
              padding: kPaddingAllSmall,
              height: kSizeLarge * 1.5,
              width: kSizeLarge * 1.5,
              decoration: BoxDecoration(
                color: kGreyColorShade300,
                borderRadius: kBorderRadiusSmall,
              ),
              child: SvgPicture.asset(icon),
            ),
            kSizeBoxVerticalTiny,
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
