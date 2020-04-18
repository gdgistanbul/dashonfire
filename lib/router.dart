import 'package:dash_on_fire/splash_view.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'main_view.dart';

class FluroRouter {
  static Router router = new Router();
  static Handler _mainHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          MainView());
          static Handler _splashHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          SplashView());

  static void setupRouter() {
    router.define("main", handler: _mainHandler);
    router.define("splash", handler: _splashHandler);
  }
}
