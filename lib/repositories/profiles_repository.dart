import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilesRepository {
  final _fireStoreUser = FirebaseFirestore.instance.collection("USERS");
  final _firebaseAuth = FirebaseAuth.instance;

  Stream<QuerySnapshot<dynamic>> getUserStream() {
    return _fireStoreUser
        .where("uid", isEqualTo: _firebaseAuth.currentUser!.uid)
        .snapshots();
  }

  Future<void> updateUser(String name, Function onUpdateSuccess,
      Function(String) onUpdateError) async {
    try {
      return _fireStoreUser
          .doc(_firebaseAuth.currentUser!.uid)
          .update({'name': name}).then((value) => onUpdateSuccess());
    } on FirebaseException catch (e) {
      onUpdateError(e.code);
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser() async {
    return _fireStoreUser.doc(_firebaseAuth.currentUser!.uid).get();
  }

  Future<void> updatePassword(String newPassword, Function onUpdateSuccess,
      Function(String) onUpdateError) async {
    try {
      final user = _firebaseAuth.currentUser;
      await user!
          .updatePassword(newPassword)
          .then((value) => onUpdateSuccess());
    } on FirebaseAuthException catch (e) {
      onUpdateError(e.code);
    }
  }

  Future<void> onCheckPassword(String password, Function onSignInSuccess, Function(String) onSignInError) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: _firebaseAuth.currentUser!.email as String, password: password).then((value) => onSignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        onSignInError("Password is not correct");
      }
    }
  }
}
