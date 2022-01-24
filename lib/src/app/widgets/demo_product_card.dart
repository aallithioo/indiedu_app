import 'package:aallithioo/src/app/themes/size.dart';
import 'package:flutter/material.dart';

class DemoProductCard extends StatelessWidget {
  const DemoProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: kSizeSmall),
      child: SizedBox(
        width: kSizeHuge * 2,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'isi-route-disini'),
        ),
      ),
    );
  }
}
