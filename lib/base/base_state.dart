import 'package:flutter/material.dart';
import 'base_bloc.dart';
import 'loading_dialog.dart';
import 'loading_widget.dart';

abstract class BaseState<T extends StatefulWidget, B extends BaseBloc>
    extends State<T> {
  B get bloc;

  ThemeData get appTheme => Theme.of(context);

  bool get dismissKeyboardWhenClickOutside => false;

  void onReceivePayload(Object? payload) {}

  void initData() {}

  @override
  void initState() {
    super.initState();
    bloc.waitingStream.listen((loading) {
      if (loading) {
        LoadingDialog.show(context);
      } else {
        LoadingDialog.close(context);
      }
    });
    bloc.stateStream.listen((state) => blocListener(state));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted) {
      final args = ModalRoute.of(context)?.settings.arguments;
      onReceivePayload(args);
    }
    initData();
  }

  @override
  Widget build(BuildContext context) {
    Widget _body;
    _body = StreamBuilder<bool>(
      stream: bloc.loadingStream,
      builder: (context, snapShot) {
        if (snapShot.data == true) {
          return buildLoading(context);
        }
        return buildContent(context);
      },
    );
    final appBar = buildAppBar(context);
    return GestureDetector(
      onTap: () {
        if (dismissKeyboardWhenClickOutside) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      // TODO: add drawers and floating
      child: Scaffold(
        appBar: appBar == null
            ? null
            : PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: appBar,
              ),
        floatingActionButton: buildFloatingActionButton(context),
        body: SafeArea(
          child: _body,
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context) => Container();

  Widget? buildAppBar(BuildContext context) => null;

  Widget? buildFloatingActionButton(BuildContext context) => null;

  Widget buildLoading(BuildContext context) => const LoadingWidget();

  // override this function to listen event change
  void blocListener(dynamic state) {}

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
