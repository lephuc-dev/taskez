import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taskez/models/list_model.dart';

class TaskRepository {
  final _fireStoreTasks = FirebaseFirestore.instance.collection("TASK");

  Stream<QuerySnapshot<dynamic>> getListTaskCardByProjectidStream(
      String project_id) {
    return _fireStoreTasks
        .where("project_id", isEqualTo: project_id)
        .snapshots();
  }

  Future<void> AddNewTaskState(List_Object list, String title, String decription, DateTimeRange time) {
    String id = (new DateTime.now().microsecondsSinceEpoch).toString();
    return _fireStoreTasks
        .doc(id)
        .set({
      "id" : id,
      "list_id" : list.id,
      "project_id" : list.projecId,
      "title" : title,
      "decription" : decription,
      "start_date" : time.start.microsecondsSinceEpoch.toString(),
      "end_date" : time.end.microsecondsSinceEpoch.toString(),
    })
        .then((value) => print("completed add task"))
        .catchError((error) => print("fail"));
  }

  Future<void> UpdateTaskState(String id, String list_id) {
    return _fireStoreTasks
        .doc(id)
        .update({
          "list_id": list_id,
        })
        .then((value) => print("completed"))
        .catchError((error) => print("fail"));
  }
}
