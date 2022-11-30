import 'theme/theme.dart';
import 'router/router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.bottomBar,
      theme: AppThemes().lightTheme,
      onGenerateRoute: (settings) => Routes.getRoute(settings),
    );
  }
}
