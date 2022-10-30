import 'package:flutter/material.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';

class SignUpPage extends StatefulWidget {
  final SignUpBloc bloc;

  const SignUpPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends BaseState<SignUpPage, SignUpBloc> {
  @override
  SignUpBloc get bloc => widget.bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
