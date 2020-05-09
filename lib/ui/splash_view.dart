import 'package:dash_on_fire/viewmodels/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_splash/flutter_splash.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context);
    return new Splash(
        seconds: 14,
        navigateAfterFuture: provider.handleStartUpLogic(),
        navigateAfterSeconds: provider.route,
        title: new Text('Dash On Fire'),
        image: new Image.asset('assets/logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}
