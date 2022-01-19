import '../../../app/routes/route.dart';

import '../../../app/themes/color.dart';
import '../../../app/themes/fontweight.dart';
import '../../../app/themes/size.dart';
import '../../../app/themes/theme.dart';

import '../../../app/widgets/custom_border.dart';
import '../../../app/widgets/custom_padding.dart';

import 'intro_content.dart';

import 'package:flutter/material.dart';

class IntroBody extends StatefulWidget {
  const IntroBody({Key? key}) : super(key: key);

  @override
  _IntroBodyState createState() => _IntroBodyState();
}

class _IntroBodyState extends State<IntroBody> {
  int currentPage = 0;
  List<Map<String, String>> introData = [
    {
      "text": "Welcome to Tooko, Let's shop!",
      "image": "assets/images/png/img_dummy_0.png",
    },
    {
      "text": "We help people to find the best products",
      "image": "assets/images/png/img_dummy_0.png",
    },
    {
      "text": "We show the easy way to buy",
      "image": "assets/images/png/img_dummy_0.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                itemBuilder: (
                  ctx,
                  index,
                ) =>
                    IntroContent(
                  image: introData[index]["image"],
                  text: introData[index]["text"],
                ),
                itemCount: introData.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: kPaddingAllLarge,
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        introData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 10),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: kBlueColorShade400,
                        borderRadius: kBorderRadiusSmall,
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.signIn);
                        },
                        child: Text(
                          "Continue",
                          style: tooko.textTheme.button!.copyWith(
                            color: kGreyColorShade50,
                            fontSize: kSizeSmall,
                            fontWeight: kFontWeightMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: kSizeTiny - 3),
      height: kSizeTiny - 2,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kBlueColorShade400 : kGreyColorShade500,
        borderRadius: kBorderRadiusTiny,
      ),
    );
  }
}
