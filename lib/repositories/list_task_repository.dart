import 'package:cloud_firestore/cloud_firestore.dart';

class ListRepository {
  final _fireStoreListTasks =
      FirebaseFirestore.instance.collection("LIST_TASKS");

  Stream<QuerySnapshot<dynamic>> getListListTaskByProjectidStream(
      String project_id) {
    return _fireStoreListTasks
        .where("project_id", isEqualTo: project_id)
        .snapshots();
  }
}
