import 'package:cloud_firestore/cloud_firestore.dart';

import '../../base/base.dart';
import '../blocs.dart';
import '../../repositories/repositories.dart';

class ProjectBloc extends BaseBloc<ProjectState> {
  final ProjectRepository projectRepository;
  final ListRepository listRepository;
  final TaskRepository taskRepository;

  ProjectBloc(this.projectRepository, this.listRepository, this.taskRepository);

  Stream<QuerySnapshot<dynamic>> getListTaskCardByProjectidStream(
      String project_id) {
    return taskRepository.getListTaskCardByProjectidStream(project_id);
  }

  Stream<QuerySnapshot<dynamic>> getListListTaskByProjectidStream(
      String project_id) {
    return listRepository.getListListTaskByProjectidStream(project_id);
  }

  Future<void> UpdateTaskState(String id, String list_id) {
    return taskRepository.UpdateTaskState(id, list_id);
  }
}
