import 'package:aallithioo/src/app/themes/theme.dart';

import '../../../../app/themes/color.dart';
import '../../../../app/themes/size.dart';
import '../../../../app/widgets/custom_border.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: kGreyColorShade200,
        borderRadius: kBorderRadiusSmall,
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: "Search Course",
          hintStyle: tooko.textTheme.bodyText2!.copyWith(
            color: kGreyColorShade500,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: kGreyColorShade500,
            size: kSizeMedium,
          ),
        ),
      ),
    );
  }
}
