import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'resources/resources.dart';
import 'dependencies/app_dependencies.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: AppColors.primaryWhite));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppDependencies.init();
  runApp(DevicePreview(enabled: false, builder: (context) => const App()));
}
