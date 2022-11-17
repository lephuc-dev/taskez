import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

class BoardRepository {
  final _boardFirestore = FirebaseFirestore.instance.collection("BOARDS");

  Stream<List<Board>> getListBoardOfWorkspaceStream(String workspaceId) {
    return _boardFirestore
        .where("workspace_id", isEqualTo: workspaceId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((document) => Board.fromJson(document.data())).toList());
  }
}
