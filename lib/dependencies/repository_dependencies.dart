import '../repositories/repositories.dart';
import 'package:get_it/get_it.dart';

class RepositoryDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<AuthenticationRepository>(() => AuthenticationRepository());
    injector.registerFactory<WorkspaceRepository>(() => WorkspaceRepository());
    injector.registerFactory<ProfilesRepository>(() => ProfilesRepository());
    injector.registerFactory<UserRepository>(() => UserRepository());
    injector.registerFactory<ProjectRepository>(() => ProjectRepository());
    injector.registerFactory<ProjectParticipantRepository>(() => ProjectParticipantRepository());
  }
}
