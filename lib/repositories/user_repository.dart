import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/models.dart';

class UserRepository {
  final _userFireStore = FirebaseFirestore.instance.collection("USERS");
  final _avatarStorage = FirebaseStorage.instance.ref().child("AVATAR");

  Stream<User> getInformationUserByIdStream(String uid) {
    return _userFireStore
        .where("uid", isEqualTo: uid)
        .snapshots()
        .map((snapshot) => User.fromJson(snapshot.docs[0].data()));
  }

  Future<void> updateUser(String name, String uid, Function onUpdateSuccess,
      Function(String) onUpdateError) async {
    try {
      return _userFireStore
          .doc(uid)
          .update({'name': name}).then((value) => onUpdateSuccess());
    } catch (e) {
      onUpdateError(e.toString());
    }
  }

  Future<void> changeAvatar(String fileName, String uid, String filePath,
      Function onUpdateSuccess, Function(String) onUpdateError) async {
    File file = File(filePath);
    Reference ref = _avatarStorage.child(uid).child("post_$fileName");

    try {
      await ref.putFile(file);

      String URL = await ref.getDownloadURL();

      await _userFireStore
          .doc(uid)
          .update({"avatar": URL}).then((value) => onUpdateSuccess());
    } catch (e) {
      onUpdateError(e.toString());
    }
  }
}
