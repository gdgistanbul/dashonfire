import 'package:dash_on_fire/locator.dart';
import 'package:dash_on_fire/router.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  FluroRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dash on Fire',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: "splash",
      onGenerateRoute: FluroRouter.router.generator,
    );
  }
}
