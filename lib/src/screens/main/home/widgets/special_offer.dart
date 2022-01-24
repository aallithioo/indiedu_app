import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/themes/size.dart';
import 'package:aallithioo/src/app/themes/theme.dart';
import 'package:aallithioo/src/app/widgets/custom_border.dart';
import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:aallithioo/src/app/widgets/custom_sizebox.dart';
import 'package:aallithioo/src/screens/main/home/widgets/section_title.dart';
import 'package:flutter/material.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: kPaddingSymetricHorizontalMedium,
          child: SectionTitle(
            title: 'Special For You',
            onTap: () {},
          ),
        ),
        kSizeBoxVerticalMedium,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                category: "Smartphone",
                image: "assets/images/png/img_dummy_0.png",
                numOfBrands: 18,
                press: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingSymetricHorizontalMedium,
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: kSizeHuge * 4,
          height: kSizeHuge * 2,
          child: ClipRRect(
            borderRadius: kBorderRadiusSmall,
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        kBlueColorShade100.withOpacity(0.5),
                        kBlueColorShade200.withOpacity(0.5),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: kPaddingAllSmall,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: tooko.textTheme.bodyText1!.copyWith(
                            color: kGreyColorShade50,
                          ),
                        ),
                        TextSpan(
                          text: "$numOfBrands Brands",
                          style: tooko.textTheme.bodyText1!.copyWith(
                            color: kGreyColorShade50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
