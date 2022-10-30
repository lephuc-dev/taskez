import '../blocs/blocs.dart';
import 'package:get_it/get_it.dart';

class BlocDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<SplashBloc>(() => SplashBloc());
    injector.registerFactory<OnBoardingBloc>(() => OnBoardingBloc());
    injector.registerFactory<SignInBloc>(() => SignInBloc(injector()));
    injector.registerFactory<SignUpBloc>(() => SignUpBloc());
    injector.registerFactory<HomeBloc>(() => HomeBloc());
  }
}
