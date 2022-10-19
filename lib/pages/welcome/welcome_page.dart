import 'package:flutter/material.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';
import '../../resources/resources.dart';
import '../../router/router.dart';

class WelcomePage extends StatefulWidget {
  final WelcomeBloc bloc;

  const WelcomePage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends BaseState<WelcomePage, WelcomeBloc> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAssets.img_hello, height: size.width * 0.5, width: size.width * 0.5),
            InkWell(
              onTap: () => Navigator.pushNamed(context, Routes.home),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Next", style: appTheme.textTheme.button),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  WelcomeBloc get bloc => widget.bloc;
}
