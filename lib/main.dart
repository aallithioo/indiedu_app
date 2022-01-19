import 'package:flutter/material.dart';

import 'src/app/routes/route.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.splash,
      routes: <String, WidgetBuilder>{},
    );
  }
}
