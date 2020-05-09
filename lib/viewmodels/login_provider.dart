import 'package:dash_on_fire/services/auth_service.dart';
import 'package:dash_on_fire/services/firestore_service.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class LoginProvider extends ChangeNotifier {

  final Auth authenticationService = locator<Auth>();
  final DataBase databaseService = locator<DataBase>();
  int count = 12;
  bool hasUser;

  void onLoginPressed(BuildContext context) async {
    await authenticationService.loginWithGoogle();
    Navigator.pushNamedAndRemoveUntil(
        context, "streams", (Route<dynamic> route) => false);
  }

  String getUser() {
    return authenticationService.user.displayName;
  }

  void onCountChanged(int newCount) {
    count = newCount;
    notifyListeners();
  }

  String route;
  Future<String> handleStartUpLogic() async {
    var hasLoggedInUser = await authenticationService.isUserLoggedIn();
//    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//    final SharedPreferences prefs = await _prefs;
//    var hasUser = prefs.getBool("hasUser") ?? false;
    hasUser = hasLoggedInUser;
    notifyListeners();
    route = "main";

    if (hasLoggedInUser) {
      route = "streams";
    } else {
      route = "main";
    }

    return await new Future<String>.delayed(Duration(seconds: 3), () => route);
  }
}
