import '../../base/base.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../blocs.dart';

class NotificationBloc extends BaseBloc<HomeState> {
  final NotificationRepository notificationRepository;
  final UserRepository userRepository;
  final InvitationRepository invitationRepository;
  final WorkspaceRepository workspaceRepository;

  NotificationBloc(this.notificationRepository, this.userRepository,
      this.invitationRepository,this.workspaceRepository);

  Stream<List<NotificationModel>> getAllNotificationsByUidStream(String uid) {
    return notificationRepository.getAllNotificationsByUidStream(uid);
  }

  Stream<List<NotificationModel>> getNotificationsByUidandTypeStream(String uid,String type) {
    return notificationRepository.getNotificationsByUidandTypeStream(uid,type);
  }

  Stream<User> getInformationUserStream(String uid) {
    return userRepository.getInformationUserByIdStream(uid);
  }

  Stream<List<InvitationModel>> getAllInvitationsByUidStream(String uid) {
    return invitationRepository.getAllInvitationsByUidStream(uid);
  }

  Stream<Workspace> getMyWorkspacesStream(String uid) {
    return workspaceRepository.getMyWorkspacesStream(uid);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
