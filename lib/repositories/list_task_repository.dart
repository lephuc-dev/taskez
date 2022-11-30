import 'package:cloud_firestore/cloud_firestore.dart';

class ListRepository {
  final _fireStoreListTasks = FirebaseFirestore.instance.collection("LIST_TASKS");

  Stream<QuerySnapshot<dynamic>> getListListTaskByProjectidStream(String projectId) {
    return _fireStoreListTasks.where("project_id", isEqualTo: projectId).snapshots();
  }

  Future<void> AddNewListState(String project_id, String name, int index) {
    String id = (new DateTime.now().microsecondsSinceEpoch).toString();
    return _fireStoreListTasks
        .doc(id)
        .set({
      "id" : id,
      "project_id" : project_id,
      "name" : name,
      "index" : index,
    })
        .then((value) => print("completed add task"))
        .catchError((error) => print("fail"));
  }

  Future<void> UpdateListPotitionState(String id, int index) {
    return _fireStoreListTasks
        .doc(id)
        .update({
      "index": index,
    })
        .then((value) => print("completed" + index.toString()))
        .catchError((error) => print("fail"));
  }
  
  Stream<QuerySnapshot<dynamic>> getListOrderbyIndexStream(String project_id)
  {
    return _fireStoreListTasks.where("project_id" , isEqualTo: project_id).orderBy("index", descending: false).snapshots();
  }
}
