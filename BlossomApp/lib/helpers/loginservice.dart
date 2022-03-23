import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testapp/models/LoginUserModel.dart';

class LoginService {
  LoginService() {
    Firebase.initializeApp();
  }

  late LoginUserModel _userModel;

  LoginUserModel get loggedInUserModel => _userModel;

  Future<bool> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();

    var googleUser = await googleSignIn.signIn();

    if (googleUser == null) { return false; }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    ) as GoogleAuthCredential;

    UserCredential userCreds = await FirebaseAuth.instance.signInWithCredential(credential);
    if (userCreds != null) {
      _userModel = LoginUserModel(
        userId: userCreds.user!.uid, 
        displayName: userCreds.user!.displayName, 
        email: userCreds.user!.email
      );
    }

    return true;
  }

  void signInAsGuest() {
    _userModel = LoginUserModel();
  }

  void emailSignIn(String userId, String name, String email) {
    _userModel = LoginUserModel(userId: userId, displayName: name, email: email);
  }

  Future <void> signOut() async {
    await GoogleSignIn().signOut();
    _userModel = LoginUserModel();
  }

}