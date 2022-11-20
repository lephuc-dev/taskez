import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:taskez/blocs/blocs.dart';

import '../../base/base_state.dart';
import '../../resources/colors.dart';

class TaskPage extends StatefulWidget {
  final TaskBloc bloc;

  const TaskPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends BaseState<TaskPage, TaskBloc> {

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBoardView(),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tiêu đề"),
                SizedBox(height: 10,),
                _titletFormField()
              ],
            ),
          )
        ),
      ),
    );
  }

  _title(String text) => Text(
    text,
    style: TextStyle(
        color: Colors.black.withOpacity(0.5),
        fontWeight: FontWeight.bold
    ),
  );

  _titletFormField() => Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.blueGrey.withOpacity(0.2),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: TextFormField(
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Nhập tiêu đề"
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      initialValue: "a",
      readOnly: true,
    ),
  );

  PreferredSizeWidget _appBarBoardView() {
    return  AppBar(
      title: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: AppColors.primaryBlue,
          ),
          Text(
            'board',
            style: TextStyle(fontSize: 22.0, color: AppColors.primaryBlack1),
          ),
        ],
      ),
    );
  }

    @override
  // TODO: implement bloc
  TaskBloc get bloc => widget.bloc;

}