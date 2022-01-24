import '../../../../app/themes/size.dart';

import 'category.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offer.dart';

import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: kSizeMedium),
            const HomeHeader(),
            SizedBox(height: kSizeSmall),
            const DiscountBanner(),
            const CategoryCard(),
            SizedBox(height: kSizeSmall),
            const SpecialOffer(),
            SizedBox(height: kSizeMedium),
            const PopularProduct(),
            SizedBox(height: kSizeMedium),
          ],
        ),
      ),
    );
  }
}
