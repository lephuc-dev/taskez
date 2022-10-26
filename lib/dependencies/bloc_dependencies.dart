import '../blocs/blocs.dart';
import 'package:get_it/get_it.dart';

class BlocDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<WelcomeBloc>(() => WelcomeBloc());
    injector.registerFactory<ProductBloc>(() => ProductBloc(injector()));
    injector.registerFactory<SplashBloc>(() => SplashBloc());
  }
}
