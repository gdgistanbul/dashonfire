import 'package:dash_on_fire/chat_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    if (user != null) {
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => ChatView(
                  userName: user.displayName,
                )),
      );
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width - 48,
          color: Colors.blue[300],
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _handleSignIn();
          },
        )),
      ),
    );
  }
}
