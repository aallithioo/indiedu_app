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
        color: kGreyColorShade300,
        borderRadius: kBorderRadiusSmall,
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: kSizeMedium,
            vertical: kSizeTiny,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: "Search Course",
          prefixIcon: const Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}
