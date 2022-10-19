import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../pages/pages.dart';
import '../router/router.dart';

class PageDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<Widget>(() => WelcomePage(injector()), instanceName: Routes.welcome);
    injector.registerFactory<Widget>(() => HomePage(injector()), instanceName: Routes.home);
  }
}
