import 'package:dash_on_fire/services/auth_service.dart';
import 'package:dash_on_fire/services/firestore_service.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class LoginProvider extends ChangeNotifier {
  final Auth authenticationService = locator<Auth>();
  final DataBase databaseService = locator<DataBase>();
  int count = 12;
  bool hasUser = false;

  void onLoginPressed(BuildContext context) async {
    await authenticationService.loginWithGoogle();
    Navigator.pushNamedAndRemoveUntil(
        context, "chat", (Route<dynamic> route) => false);
  }

  String getUser() {
    return authenticationService.user.displayName;
  }

  void onCountChanged(int newCount) {
    count = newCount;
    notifyListeners();
  }

  isUserExist() async{
    hasUser =  authenticationService.getCuurrentUser() != null;
    notifyListeners();
  }
}
