import '../../base/base.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../blocs.dart';

class NotificationBloc extends BaseBloc<HomeState> {
  final NotificationRepository notificationRepository;
  final UserRepository userRepository;
  final WorkspaceRepository workspaceRepository;

  NotificationBloc(this.notificationRepository, this.userRepository,this.workspaceRepository);

  Stream<List<NotificationModel>> getAllNotificationsByUidStream(String uid) {
    return notificationRepository.getAllNotificationsByUidStream(uid);
  }

  Stream<List<NotificationModel>> getNotificationsByUidandTypeStream(String uid,String type) {
    return notificationRepository.getNotificationsByUidandTypeStream(uid,type);
  }

  Stream<User> getInformationUserStream(String uid) {
    return userRepository.getInformationUserByIdStream(uid);
  }



  Stream<Workspace> getMyWorkspacesStream(String uid) {
    return workspaceRepository.getMyWorkspacesStream(uid);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
