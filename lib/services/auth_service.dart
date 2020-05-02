import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
    }
    return user;
  }

  Future<FirebaseUser> getCuurrentUser()async{
    _user = await _auth.currentUser();
    return _user;
  }

  void signOut()async{
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    print(_googleSignIn.currentUser);
  }
}
