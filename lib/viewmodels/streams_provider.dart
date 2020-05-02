import 'package:dash_on_fire/services/auth_service.dart';
import 'package:dash_on_fire/services/firestore_service.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class StreamsProvider extends ChangeNotifier {
  final Auth authenticationService = locator<Auth>();
  final DataBase databaseService = locator<DataBase>();

  signOut(BuildContext context) {
    authenticationService.signOut();
     Navigator.pushNamedAndRemoveUntil(
        context, "main", (Route<dynamic> route) => false);
  }
}
