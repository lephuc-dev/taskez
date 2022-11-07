import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../pages/pages.dart';
import '../router/router.dart';

class PageDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<Widget>(() => HomePage(injector()),
        instanceName: Routes.home);
    injector.registerFactory<Widget>(() => SplashPage(injector()),
        instanceName: Routes.splash);
    injector.registerFactory<Widget>(() => OnBoardingPage(injector()),
        instanceName: Routes.onBoarding);
    injector.registerFactory<Widget>(() => MyInformationPage(injector()),
        instanceName: Routes.myInformation);
  }
}
