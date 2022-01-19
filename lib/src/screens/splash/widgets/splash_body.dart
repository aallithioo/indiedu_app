import 'package:aallithioo/src/app/themes/color.dart';
import 'package:aallithioo/src/app/themes/fontweight.dart';
import 'package:aallithioo/src/app/themes/size.dart';
import 'package:aallithioo/src/app/themes/theme.dart';
import 'package:aallithioo/src/app/widgets/custom_border.dart';
import 'package:aallithioo/src/app/widgets/custom_padding.dart';
import 'package:aallithioo/src/screens/splash/widgets/splash_content.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
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
                    SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]["text"],
                ),
                itemCount: splashData.length,
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
                padding: kPaddingAllMedium,
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 4),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: kBlueColorShade400,
                        borderRadius: kBorderRadiusSmall,
                      ),
                      child: TextButton(
                        onPressed: () {},
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
                    const Spacer(),
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
