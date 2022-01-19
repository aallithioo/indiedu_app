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
              flex: 3,
              child: PageView.builder(
                itemBuilder: (
                  ctx,
                  index,
                ) =>
                    SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]["text"],
                ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
