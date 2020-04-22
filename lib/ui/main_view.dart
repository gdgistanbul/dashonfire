import 'package:dash_on_fire/ui/chat_view.dart';
import 'package:dash_on_fire/viewmodels/login_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
 

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Container(
          child: Center(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
      Image.asset('assets/logo.png'),
      SizedBox(height:20),
      MaterialButton(
        minWidth: MediaQuery.of(context).size.width - 48,
        color: Colors.blue[300],
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          provider.onLoginPressed(context);
        },
      ),
            ],
          )),
        ));
  }
}
