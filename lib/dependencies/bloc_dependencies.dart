import 'package:taskez/blocs/task/task.dart';

import '../blocs/blocs.dart';
import 'package:get_it/get_it.dart';

class BlocDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<SplashBloc>(() => SplashBloc());
    injector.registerFactory<OnBoardingBloc>(() => OnBoardingBloc());
    injector.registerFactory<SignInBloc>(() => SignInBloc(injector()));
    injector.registerFactory<SignUpBloc>(() => SignUpBloc(injector()));
    injector.registerFactory<NotificationBloc>(() => NotificationBloc(injector(),injector(),injector(),injector(),));
    injector.registerFactory<HomeBloc>(
        () => HomeBloc(injector(), injector(), injector(), injector()));
    injector.registerFactory<ProjectBloc>(
        () => ProjectBloc(injector(), injector(), injector()));
    injector.registerFactory<TaskBloc>(() => TaskBloc(injector()));
  }
}
