import 'package:flutter/material.dart';
import 'package:flutter_splash/flutter_splash.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Splash(
        seconds: 14,
        navigateAfterSeconds: "main",
        title: new Text('Dash On Fire'),
        image: new Image.asset('assets/logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}
