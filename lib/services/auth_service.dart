import 'package:dash_on_fire/model/user.dart';
import 'package:dash_on_fire/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../locator.dart';

class Auth {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DataBase databaseService = locator<DataBase>();

  FirebaseUser _user;

  FirebaseUser get user => _user;

  Future<FirebaseUser> loginWithGoogle() async {
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
      _user = user;
      User newUser =
          User(uid: user.uid, email: user.email, name: user.displayName);
      await databaseService.createUser(newUser);
    }
    return user;
  }

  Future<FirebaseUser> getCuurrentUser() async {
    _user = await _auth.currentUser();
    return _user;
  }

  Future<bool> isUserLoggedIn() async {
    _user = await _auth.currentUser();
    return _user != null;
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
  }
}
