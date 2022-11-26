import '../../base/base.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../blocs.dart';

class NotificationBloc extends BaseBloc<HomeState> {
  final NotificationRepository notificationRepository;
  final UserRepository userRepository;
  final ProjectRepository projectRepository;
  final AuthenticationRepository authenticationRepository;

  NotificationBloc(this.notificationRepository, this.userRepository,
      this.projectRepository, this.authenticationRepository);

  Stream<List<NotificationModel>> getAllNotificationsByUidStream(String uid) {
    return notificationRepository.getAllNotificationsByUidStream(uid);
  }

  Stream<List<NotificationModel>> getNotificationsByUidandTypeStream(
      String uid, String type) {
    return notificationRepository.getNotificationsByUidandTypeStream(uid, type);
  }

  Stream<User> getInformationUserStream(String uid) {
    return userRepository.getInformationUserByIdStream(uid);
  }

  String getCurrentUserId() {
    return authenticationRepository.getCurrentUserId();
  }

  Stream<Project> getProjectStream(String uid) {
    return projectRepository.getProjectStream(uid);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
