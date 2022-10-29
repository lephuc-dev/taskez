import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signIn(String email, String password, Function onSignInSuccess, Function(String) onSignInError) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((value) => onSignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onSignInError("User account not found");
      }
      if (e.code == 'wrong-password') {
        onSignInError("Password is not correct");
      }
    }
  }
}
