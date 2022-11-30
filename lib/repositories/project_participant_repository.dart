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

  Stream<List<ProjectParticipant>> getListFavoriteProjectParticipantByUidStream(String userId) {
    return _projectParticipantFirestore
        .where("user_id", isEqualTo: userId)
        .where("favorite", isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((document) => ProjectParticipant.fromJson(document.data())).toList());
  }

  Stream<List<ProjectParticipant>> getListProjectParticipantByProjectIdStream(String projectId) {
    return _projectParticipantFirestore
        .where("project_id", isEqualTo: projectId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((document) => ProjectParticipant.fromJson(document.data())).toList());
  }
}
