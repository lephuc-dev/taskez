import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? email;
  String? avatar;
  String? name;

  UserModel({this.uid, this.email, this.avatar, this.name});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    avatar = json['avatar'];
    name = json['name'];
  }

  UserModel.fromDocumentSnapshot(QueryDocumentSnapshot<Object?>? object) {
    uid = object?['uid'];
    email = object?['email'];
    avatar = object?['avatar'];
    name = object?['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['avatar'] = avatar;
    data['name'] = name;
    return data;
  }
}
