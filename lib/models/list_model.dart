import 'package:cloud_firestore/cloud_firestore.dart';

import 'models.dart';

class List_Object {
  String? id;
  String? projecId;
  String? name;
  List<Card_Object>? card_object;

  List_Object({this.id, this.projecId, this.name, this.card_object});

  List_Object.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    projecId = json['project_id'] ?? "";
    if (json['card_object'] != null) {
      card_object = <Card_Object>[];
      json['card_object'].forEach((v) {
        card_object!.add(new Card_Object.fromJson(v));
      });
    }
  }

  factory List_Object.fromDocument(DocumentSnapshot doc) {
    return List_Object(
      id: doc['id'],
      projecId: doc['project_id'],
      name: doc['name'],
      card_object: [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projecId;
    data['name'] = this.name;
    if (this.card_object != null) {
      data['card_object'] = this.card_object!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
