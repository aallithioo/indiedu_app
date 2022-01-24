import 'package:aallithioo/src/data/models/product.dart';
import 'package:flutter/material.dart';

class DemoProductDetailsBody extends StatelessWidget {
  final Product product;

  const DemoProductDetailsBody({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // ProductImages(product: product),
        // TopRoundedContainer(
        //   color: Colors.white,
        //   child: Column(
        //     children: [
        //       ProductDescription(
        //         product: product,
        //         pressOnSeeMore: () {},
        //       ),
        //       TopRoundedContainer(
        //         color: Color(0xFFF6F7F9),
        //         child: Column(
        //           children: [
        //             ColorDots(product: product),
        //             TopRoundedContainer(
        //               color: Colors.white,
        //               child: Padding(
        //                 padding: EdgeInsets.only(
        //                   left: SizeConfig.screenWidth * 0.15,
        //                   right: SizeConfig.screenWidth * 0.15,
        //                   bottom: getProportionateScreenWidth(40),
        //                   top: getProportionateScreenWidth(15),
        //                 ),
        //                 child: DefaultButton(
        //                   text: "Add To Cart",
        //                   press: () {},
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //   ],
        // ),
        // ),
      ],
    );
  }
}
