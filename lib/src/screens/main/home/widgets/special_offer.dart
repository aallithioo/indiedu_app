import 'package:aallithioo/src/app/themes/fontweight.dart';

import '../../../../app/themes/color.dart';
import '../../../../app/themes/size.dart';
import '../../../../app/themes/theme.dart';

import '../../../../app/widgets/custom_border.dart';
import '../../../../app/widgets/custom_padding.dart';
import '../../../../app/widgets/custom_sizebox.dart';

import 'section_title.dart';

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
                category: "Math",
                image: "assets/images/png/img_dummy_2.png",
                numOfBrands: 4,
                press: () {},
              ),
              SpecialOfferCard(
                category: "Social",
                image: "assets/images/png/img_dummy_2.png",
                numOfBrands: 6,
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

  final String category;
  final String image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingSymetricHorizontalSmall * 1.2,
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: kSizeHuge * 3.6,
          height: kSizeHuge * 1.4,
          child: ClipRRect(
            borderRadius: kBorderRadiusSmall * 1.1,
            child: Stack(
              children: [
                Image.asset(
                  image,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        kBlueColorShade500,
                        kBlueColorShade400,
                        kBlueColorShade500,
                        kBlueColorShade600,
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
                          style: indiedu.textTheme.bodyText1!.copyWith(
                            color: kGreyColorShade50,
                            fontWeight: kFontWeightSemiBold,
                          ),
                        ),
                        TextSpan(
                          text: "$numOfBrands Class",
                          style: indiedu.textTheme.bodyText1!.copyWith(
                            color: kGreyColorShade50,
                            fontSize: 12,
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
