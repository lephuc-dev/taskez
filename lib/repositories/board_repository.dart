import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';
import 'package:flutter/foundation.dart';

class BoardRespository{
  final _fireStoreTasks = FirebaseFirestore.instance.collection("TASK");
  final _fireStoreListTasks = FirebaseFirestore.instance.collection("LIST_TASKS");

  Stream<QuerySnapshot<dynamic>> getListTaskCardByBoardidStream(String board_id) {
    return _fireStoreTasks.where("board_id", isEqualTo: board_id).snapshots();
  }
  
  Stream<QuerySnapshot<dynamic>> getListListTaskByBoardidStream(String board_id){
    return _fireStoreListTasks.where("board_id", isEqualTo: board_id).snapshots();
  }
}