import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

class UserRepository {
  final _userFireStore = FirebaseFirestore.instance.collection("USERS");

  Stream<User> getInformationUserByIdStream(String uid) {
    return _userFireStore.where("uid", isEqualTo: uid).snapshots().map((snapshot) => User.fromJson(snapshot.docs[0].data()));
  }
}
