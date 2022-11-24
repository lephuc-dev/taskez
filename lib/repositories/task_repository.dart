import 'package:cloud_firestore/cloud_firestore.dart';

class TaskRepository {
  final _fireStoreTasks = FirebaseFirestore.instance.collection("TASK");

  Stream<QuerySnapshot<dynamic>> getListTaskCardByProjectidStream(
      String project_id) {
    return _fireStoreTasks
        .where("project_id", isEqualTo: project_id)
        .snapshots();
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
