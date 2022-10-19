import 'package:device_preview/device_preview.dart';
import 'dependencies/app_dependencies.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppDependencies.init();
  runApp(DevicePreview(enabled: true, builder: (context) => const App()));
}
