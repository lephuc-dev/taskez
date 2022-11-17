import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskez/models/models.dart';

class Card_Object {
  String? id;
  String? boardId;
  String? listId;
  String? title;
  String? decription;
  String? startDate;
  String? endDate;

  Card_Object(
      {this.id,
        this.boardId,
        this.listId,
        this.title,
        this.decription,
        this.startDate,
        this.endDate});

  Card_Object.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    boardId = json['board_id'] ?? "";
    listId = json['list_id'] ?? "";
    title = json['title'] ?? "";
    decription = json['decription'] ?? "";
    startDate = json['start_date'] ?? "";
    endDate = json['end_date'] ?? "";
  }

  factory Card_Object.fromDocument(DocumentSnapshot doc){
    return Card_Object(
      id: doc['id'],
      boardId: doc['board_id'],
      listId: doc['list_id'],
      title: doc['title'],
      decription: doc['decription'],
      startDate: doc['start_date'],
      endDate: doc['end_date']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['board_id'] = this.boardId;
    data['list_id'] = this.listId;
    data['title'] = this.title;
    data['decription'] = this.decription;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}
