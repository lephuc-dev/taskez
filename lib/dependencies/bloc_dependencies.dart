import 'package:taskez/blocs/change_password/change_password.dart';
import 'package:taskez/blocs/edit_profiles/edit_prodfiles.dart';
import 'package:taskez/blocs/settings/settings_bloc.dart';

import '../blocs/blocs.dart';
import 'package:get_it/get_it.dart';

class BlocDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<SplashBloc>(() => SplashBloc());
    injector.registerFactory<OnBoardingBloc>(() => OnBoardingBloc());
    injector.registerFactory<MyInformationBloc>(() => MyInformationBloc(injector()));
    injector.registerFactory<SignInBloc>(() => SignInBloc(injector()));
    injector.registerFactory<SignUpBloc>(() => SignUpBloc(injector()));
    injector.registerFactory<HomeBloc>(() => HomeBloc(injector()));
    injector.registerFactory<SettingsBloc>(() => SettingsBloc());
    injector.registerFactory<ChangePasswordBloc>(() => ChangePasswordBloc(injector()));
    injector.registerFactory<EditProfilesBloc>(() => EditProfilesBloc(injector()));
  }
}
