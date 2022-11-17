import '../repositories/repositories.dart';
import 'package:get_it/get_it.dart';

class RepositoryDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<ProductRepository>(() => ProductRepository());
    injector.registerFactory<BoardRespository>(() => BoardRespository());
  }
}
