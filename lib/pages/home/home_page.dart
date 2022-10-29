import '../../base/base.dart';
import '../../blocs/blocs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  final HomeBloc bloc;

  const HomePage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }

  @override
  HomeBloc get bloc => widget.bloc;
}
