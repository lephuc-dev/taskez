import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

class ProjectParticipantRepository {
  final _projectParticipantFirestore = FirebaseFirestore.instance.collection("PROJECT_PARTICIPANT");

  Stream<List<ProjectParticipant>> getListProjectParticipantByUidStream(String userId) {
    return _projectParticipantFirestore
        .where("user_id", isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((document) => ProjectParticipant.fromJson(document.data())).toList());
  }
}
