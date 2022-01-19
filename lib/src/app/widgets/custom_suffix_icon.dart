import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes/size.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        kSizeSmall,
        kSizeSmall,
        kSizeSmall,
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: kSizeSmall,
      ),
    );
  }
}
