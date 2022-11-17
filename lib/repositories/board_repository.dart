import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';
import 'package:flutter/foundation.dart';

class BoardRespository{
  final _boardFirestore = FirebaseFirestore.instance.collection("BOARDS");
  final _fireStoreTasks = FirebaseFirestore.instance.collection("TASK");
  final _fireStoreListTasks = FirebaseFirestore.instance.collection("LIST_TASKS");

  Stream<QuerySnapshot<dynamic>> getListTaskCardByBoardidStream(String board_id) {
    return _fireStoreTasks.where("board_id", isEqualTo: board_id).snapshots();
  }
  
  Stream<QuerySnapshot<dynamic>> getListListTaskByBoardidStream(String board_id){
    return _fireStoreListTasks.where("board_id", isEqualTo: board_id).snapshots();
  }

  Stream<List<Board>> getListBoardOfWorkspaceStream(String workspaceId) {
    return _boardFirestore
        .where("workspace_id", isEqualTo: workspaceId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((document) => Board.fromJson(document.data())).toList());
  }
}
