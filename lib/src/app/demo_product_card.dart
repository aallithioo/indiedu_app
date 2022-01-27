import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/themes/fontweight.dart';
import 'package:aallithioo/src/app/themes/size.dart';
import 'package:aallithioo/src/app/themes/theme.dart';
import 'package:aallithioo/src/app/widgets/custom_border.dart';
import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:aallithioo/src/app/widgets/custom_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:aallithioo/src/data/models/product.dart';

import '../screens/main/details/demo_product_details_arguments.dart';

class DemoProductCard extends StatelessWidget {
  const DemoProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: kSizeSmall),
      child: SizedBox(
        width: kSizeHuge * 2,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            'isi-route-disini',
            arguments: DemoProductDetailsArguments(product: product),
          ),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: kPaddingAllMedium,
                  decoration: BoxDecoration(
                    color: kGreyColorShade200,
                    borderRadius: kBorderRadiusSmall,
                  ),
                  child: Hero(
                    tag: product.id.toString(),
                    child: Image.asset(
                      product.images[0],
                    ),
                  ),
                ),
              ),
              kSizeBoxVerticalSmall,
              Text(
                product.title,
                style: indiedu.textTheme.headline6!.copyWith(
                  color: kGreyColorShade900,
                  fontSize: kSizeSmall,
                  fontWeight: kFontWeightMedium,
                ),
                maxLines: 2,
                textAlign: TextAlign.left,
              ),
              kSizeBoxVerticalSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: indiedu.textTheme.bodyText1!.copyWith(
                      color: kBlueColorShade400,
                      fontSize: kSizeSmall,
                      fontWeight: kFontWeightSemiBold,
                    ),
                  ),
                  InkWell(
                    borderRadius: kBorderRadiusMedium * 2,
                    onTap: () {},
                    child: Container(
                      padding: kPaddingAllTiny / 1.3,
                      height: kSizeMedium,
                      width: kSizeMedium,
                      decoration: BoxDecoration(
                        color: product.isFavourite
                            ? kErrorColor
                            : kGreyColorShade300,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/svg/Heart Icon_2.svg',
                        color: product.isFavourite
                            ? kGreyColorShade50
                            : kGreyColorShade100,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
