import 'package:cloud_firestore/cloud_firestore.dart';
import '../../base/base.dart';
import '../../repositories/repositories.dart';
import '../blocs.dart';

class HomeBloc extends BaseBloc<HomeState> {
  final WorkspaceRepository workspaceRepository;

  HomeBloc(this.workspaceRepository);

  Stream<QuerySnapshot<dynamic>> getWorkspacesParticipantByUidStream() {
    return workspaceRepository.getWorkspacesParticipantByUidStream();
  }

  Stream<QuerySnapshot<dynamic>> getWorkspacesParticipantByWorkspaceIdStream(String workspaceId) {
    return workspaceRepository.getWorkspacesParticipantByWorkspaceIdStream(workspaceId);
  }

  Stream<QuerySnapshot<dynamic>> getMyWorkspacesStream(String workspaceId) {
    return workspaceRepository.getMyWorkspacesStream(workspaceId);
  }

  Stream<QuerySnapshot<dynamic>> getListBoardOfWorkspaceStream(String workspaceId) {
    return workspaceRepository.getListBoardOfWorkspaceStream(workspaceId);
  }

  Stream<QuerySnapshot<dynamic>> getInformationUserStream() {
    return workspaceRepository.getInformationUserStream();
  }

  Stream<QuerySnapshot<dynamic>> getInformationUserByIdStream(String uid) {
    return workspaceRepository.getInformationUserByIdStream(uid);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
