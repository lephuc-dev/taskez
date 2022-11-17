import 'package:cloud_firestore/cloud_firestore.dart';
import '../../base/base.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../blocs.dart';

class HomeBloc extends BaseBloc<HomeState> {
  final AuthenticationRepository authenticationRepository;
  final WorkspaceRepository workspaceRepository;
  final BoardRepository boardRepository;
  final UserRepository userRepository;
  final WorkspaceParticipantRepository workspaceParticipantRepository;

  HomeBloc(this.authenticationRepository, this.userRepository, this.workspaceRepository, this.boardRepository, this.workspaceParticipantRepository);

  Stream<List<WorkspaceParticipant>> getWorkspacesParticipantByUidStream() {
    return workspaceParticipantRepository.getWorkspacesParticipantByUidStream(authenticationRepository.getCurrentUserId());
  }

  Stream<List<WorkspaceParticipant>> getWorkspacesParticipantByWorkspaceIdStream(String workspaceId) {
    return workspaceParticipantRepository.getWorkspacesParticipantByWorkspaceIdStream(workspaceId);
  }

  Stream<Workspace> getMyWorkspacesStream(String workspaceId) {
    return workspaceRepository.getMyWorkspacesStream(workspaceId);
  }

  Stream<List<Board>> getListBoardOfWorkspaceStream(String workspaceId) {
    return boardRepository.getListBoardOfWorkspaceStream(workspaceId);
  }

  Stream<User> getInformationUserStream() {
    return userRepository.getInformationUserByIdStream(authenticationRepository.getCurrentUserId());
  }

  Stream<User> getInformationUserByIdStream(String uid) {
    return userRepository.getInformationUserByIdStream(uid);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
