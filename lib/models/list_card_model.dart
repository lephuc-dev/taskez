import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskez/models/task_card_model.dart';

class List_Object {
  String? id;
  String? boardId;
  String? name;
  List<Card_Object>? card_object;

  List_Object({this.id,this.boardId, this.name, this.card_object});

  List_Object.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    boardId = json['board_id'] ?? "";
    if (json['card_object'] != null) {
      card_object = <Card_Object>[];
      json['card_object'].forEach((v) {
        card_object!.add(new Card_Object.fromJson(v));
      });
    }
  }

  factory List_Object.fromDocument(DocumentSnapshot doc){
    return List_Object(
        id: doc['id'],
        boardId: doc['board_id'],
        name: doc['name'],
        card_object: [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['board_id'] = this.boardId;
    data['name'] = this.name;
    if (this.card_object != null) {
      data['card_object'] = this.card_object!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

