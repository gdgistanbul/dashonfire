import 'package:dash_on_fire/ui/main_view.dart';
import 'package:dash_on_fire/ui/splash_view.dart';
import 'package:dash_on_fire/ui/streams_view.dart';
import 'package:dash_on_fire/viewmodels/login_provider.dart';
import 'package:dash_on_fire/viewmodels/streams_provider.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FluroRouter {
  static Router router = new Router();
  static Handler _mainHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ChangeNotifierProvider(
              create: (_) => LoginProvider(), child: MainView()));
  static Handler _splashHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ChangeNotifierProvider(
              create: (_) => LoginProvider(), child:SplashView()));
  static Handler _chatHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ChangeNotifierProvider(
            create: (_)=> StreamsProvider(),
            child: StreamsView()));

  static void setupRouter() {
    router.define("main", handler: _mainHandler);
    router.define("chat", handler: _chatHandler);
    router.define("splash", handler: _splashHandler);
  }
}
