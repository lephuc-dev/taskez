import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

class WorkspaceParticipantRepository {
  final _workspaceParticipantFirestore = FirebaseFirestore.instance.collection("WORKSPACE_PARTICIPANT");

  Stream<List<WorkspaceParticipant>> getWorkspacesParticipantByUidStream(String currentUid) {
    return _workspaceParticipantFirestore
        .where("user_id", isEqualTo: currentUid)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((document) => WorkspaceParticipant.fromJson(document.data())).toList());
  }

  Stream<List<WorkspaceParticipant>> getWorkspacesParticipantByWorkspaceIdStream(String workspaceId) {
    return _workspaceParticipantFirestore
        .where("workspace_id", isEqualTo: workspaceId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((document) => WorkspaceParticipant.fromJson(document.data())).toList());
  }
}
