import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

class WorkspaceRepository {
  final _workspaceFirestore = FirebaseFirestore.instance.collection("WORKSPACES");

  Stream<Workspace> getMyWorkspacesStream(String workspaceId) {
    return _workspaceFirestore.where("id", isEqualTo: workspaceId).snapshots().map((snapshot) => Workspace.fromJson(snapshot.docs[0].data()));
  }
}
