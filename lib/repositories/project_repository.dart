import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

class ProjectRepository {
  final _projectFirestore = FirebaseFirestore.instance.collection("PROJECTS");

  Stream<Project> getProjectStream(String projectId) {
    return _projectFirestore.where("id", isEqualTo: projectId).snapshots().map((snapshot) => Project.fromJson(snapshot.docs[0].data()));
  }
}
