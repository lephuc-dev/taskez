import 'package:cloud_firestore/cloud_firestore.dart';
import '../../base/base.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../blocs.dart';

class HomeBloc extends BaseBloc<HomeState> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  final ProjectRepository projectRepository;
  final ProjectParticipantRepository projectParticipantRepository;

  HomeBloc(this.authenticationRepository, this.userRepository, this.projectRepository, this.projectParticipantRepository);

  Stream<User> getInformationUserStream() {
    return userRepository.getInformationUserByIdStream(authenticationRepository.getCurrentUserId());
  }

  Stream<User> getInformationUserByIdStream(String uid) {
    return userRepository.getInformationUserByIdStream(uid);
  }

  Stream<List<ProjectParticipant>> getListProjectByMyIdStream() {
    return projectParticipantRepository.getListProjectParticipantByUidStream(authenticationRepository.getCurrentUserId());
  }

  Stream<List<ProjectParticipant>> getListFavoriteProjectByMyIdStream() {
    return projectParticipantRepository.getListFavoriteProjectParticipantByUidStream(authenticationRepository.getCurrentUserId());
  }

  Stream<Project> getProjectStream(String projectId) {
    return projectRepository.getProjectStream(projectId);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
