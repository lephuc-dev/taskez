import 'package:taskez/blocs/change_password/change_password.dart';
import 'package:taskez/blocs/edit_profiles/edit_prodfiles.dart';

import '../blocs/blocs.dart';
import 'package:get_it/get_it.dart';

class BlocDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<SplashBloc>(() => SplashBloc());
    injector.registerFactory<OnBoardingBloc>(() => OnBoardingBloc());
    injector.registerFactory<MyInformationBloc>(() => MyInformationBloc(injector(), injector()));
    injector.registerFactory<SignInBloc>(() => SignInBloc(injector()));
    injector.registerFactory<SignUpBloc>(() => SignUpBloc(injector()));
    injector.registerFactory<ChangePasswordBloc>(() => ChangePasswordBloc(injector(), injector()));
    injector.registerFactory<EditProfilesBloc>(() => EditProfilesBloc(injector(), injector()));
    injector.registerFactory<HomeBloc>(() => HomeBloc(injector(), injector(), injector(), injector()));
    injector.registerFactory<ProjectBloc>(() => ProjectBloc(injector()));
    injector.registerFactory<ChangeAvatarBloc>(() => ChangeAvatarBloc(injector(), injector()));
  }
}
