import 'package:aallithioo/src/data/models/product.dart';
import 'package:flutter/material.dart';

import 'widgets/demo_product_details_body.dart';

class DemoProductDetails extends StatelessWidget {
  const DemoProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DemoProductDetailsArguments arguments = ModalRoute.of(context)!
        .settings
        .arguments as DemoProductDetailsArguments;
    return Scaffold(
      body: DemoProductDetailsBody(
        product: arguments.product!,
      ),
    );
  }
}

class DemoProductDetailsArguments {
  Product? product;

  DemoProductDetailsArguments({required this.product});
}
