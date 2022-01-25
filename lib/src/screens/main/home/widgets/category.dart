import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/themes/size.dart';
import 'package:aallithioo/src/app/widgets/custom_border.dart';
import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:aallithioo/src/app/widgets/custom_sizebox.dart';
import 'package:aallithioo/src/app/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/svg/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/svg/Bill Icon.svg", "text": "Bill"},
      {"icon": "assets/icons/svg/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/svg/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/svg/Discover.svg", "text": "More"},
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
            press: () => ScaffoldMessenger.of(context)
                .showSnackBar(kSnackBar('Feature are not available yet!')!),
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
      child: Column(
        children: [
          Container(
            padding: kPaddingAllSmall,
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              // color: kGreyColorShade200,
              color: Color(0xFFFFECDF),
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
    );
  }
}
