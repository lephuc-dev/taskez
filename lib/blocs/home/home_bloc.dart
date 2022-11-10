import 'package:cloud_firestore/cloud_firestore.dart';

import '../../base/base.dart';
import '../../repositories/repositories.dart';
import '../blocs.dart';

class HomeBloc extends BaseBloc<HomeState> {
  final WorkspaceRepository workspaceRepository;

  HomeBloc(this.workspaceRepository);

  Stream<QuerySnapshot<dynamic>> getWorkspacesParticipantStream() {
    return workspaceRepository.getWorkspacesParticipantStream();
  }

  Stream<QuerySnapshot<dynamic>> getMyWorkspacesStream(String workspaceId) {
    return workspaceRepository.getMyWorkspacesStream(workspaceId);
  }

  Stream<QuerySnapshot<dynamic>> getListBoardOfWorkspaceStream(String workspaceId) {
    return workspaceRepository.getListBoardOfWorkspaceStream(workspaceId);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
