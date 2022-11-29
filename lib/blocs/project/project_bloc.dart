import 'package:cloud_firestore/cloud_firestore.dart';

import '../../base/base.dart';
import '../../models/models.dart';
import '../blocs.dart';
import '../../repositories/repositories.dart';

class ProjectBloc extends BaseBloc<ProjectState> {
  final ProjectRepository projectRepository;
  final ListRepository listRepository;
  final TaskRepository taskRepository;
  final ProjectParticipantRepository participantRepository;

  ProjectBloc(this.projectRepository, this.listRepository, this.taskRepository, this.participantRepository);

  Stream<QuerySnapshot<dynamic>> getListTaskCardByProjectidStream(
      String project_id) {
    return taskRepository.getListTaskCardByProjectidStream(project_id);
  }

  Stream<QuerySnapshot<dynamic>> getListListTaskByProjectidStream(
      String project_id) {
    return listRepository.getListListTaskByProjectidStream(project_id);
  }

  Stream<QuerySnapshot<dynamic>> getListOrderbyIndexStream(String project_id){
    return listRepository.getListOrderbyIndexStream(project_id);
  }

  Stream<List<ProjectParticipant>> getListProjectParticipantByProjectIdStream(String project_id){
    return participantRepository.getListProjectParticipantByProjectIdStream(project_id);
  }

  Future<void> AddNewListState(String project_id, String name, int index){
    return listRepository.AddNewListState(project_id, name, index);
  }

  Future<void> UpdateTaskState(String id, String list_id) {
    return taskRepository.UpdateTaskState(id, list_id);
  }

  Future<void> UpdateListPositionState(String id, int index) {
    return listRepository.UpdateListPotitionState(id, index);
  }
}
