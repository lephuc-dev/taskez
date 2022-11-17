import '../repositories/repositories.dart';
import 'package:get_it/get_it.dart';

class RepositoryDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<ProductRepository>(() => ProductRepository());
    injector.registerFactory<BoardRespository>(() => BoardRespository());
    injector.registerFactory<AuthenticationRepository>(() => AuthenticationRepository());
    injector.registerFactory<WorkspaceRepository>(() => WorkspaceRepository());
    injector.registerFactory<BoardRepository>(() => BoardRepository());
    injector.registerFactory<UserRepository>(() => UserRepository());
    injector.registerFactory<WorkspaceParticipantRepository>(() => WorkspaceParticipantRepository());
  }
}
