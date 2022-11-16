import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WorkspaceRepository {
  final _fireStoreWorkspace = FirebaseFirestore.instance.collection("WORKSPACES");
  final _fireStoreBoard = FirebaseFirestore.instance.collection("BOARDS");
  final _fireStoreWorkspaceParticipant = FirebaseFirestore.instance.collection("WORKSPACE_PARTICIPANT");
  final _fireStoreUser = FirebaseFirestore.instance.collection("USERS");
  final _firebaseAuth = FirebaseAuth.instance;

  Stream<QuerySnapshot<dynamic>> getWorkspacesParticipantByUidStream() {
    return _fireStoreWorkspaceParticipant.where("user_id", isEqualTo: _firebaseAuth.currentUser?.uid ?? "").snapshots();
  }

  Stream<QuerySnapshot<dynamic>> getWorkspacesParticipantByWorkspaceIdStream(String workspaceId) {
    return _fireStoreWorkspaceParticipant.where("workspace_id", isEqualTo: workspaceId).snapshots();
  }

  Stream<QuerySnapshot<dynamic>> getMyWorkspacesStream(String workspaceId) {
    return _fireStoreWorkspace.where("id", isEqualTo: workspaceId).snapshots();
  }

  Stream<QuerySnapshot<dynamic>> getListBoardOfWorkspaceStream(String workspaceId) {
    return _fireStoreBoard.where("workspace_id", isEqualTo: workspaceId).snapshots();
  }

  Stream<QuerySnapshot<dynamic>> getInformationUserStream() {
    return _fireStoreUser.where("uid", isEqualTo: _firebaseAuth.currentUser?.uid).limit(1).snapshots();
  }

  Stream<QuerySnapshot<dynamic>> getInformationUserByIdStream(String uid) {
    return _fireStoreUser.where("uid", isEqualTo: uid).limit(1).snapshots();
  }
}
