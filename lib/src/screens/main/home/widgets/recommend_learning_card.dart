import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/widgets/custom_border.dart';
import 'package:aallithioo/src/app/widgets/custom_margin.dart';
import 'package:flutter/material.dart';

class RecommendLearningCard extends StatelessWidget {
  final String? title;
  final String? subject;
  final String? grade;
  final String? image;
  final GestureTapCallback press;

  const RecommendLearningCard(
    Key? key,
    this.title,
    this.subject,
    this.grade,
    this.image,
    this.press,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Card(
        margin: kMarginSymetricHorizontalTiny,
        shape: kRoundedBorderRadiusSmall,
        color: kWhiteColorShade800,
        shadowColor: kTransparentColor,
      ),
    );
  }
}
