import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:taskez/blocs/blocs.dart';
import 'package:taskez/models/list_model.dart';
import 'package:intl/intl.dart';
import '../../widgets/widgets.dart';
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
  DateTimeRange? _selectRange;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _decriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final list = (ModalRoute.of(context)!.settings.arguments
    as Map)["list"] as List_Object;
    return Scaffold(
      appBar: commonAppBar(context, title: list.name),
      body: SingleChildScrollView(
        child: Form(
            key: _formkey,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title("Title"),
                  SizedBox(height: 10,),
                  _titletFormField(),
                  SizedBox(height: 10,),
                  _title("Decriptions"),
                  SizedBox(height: 10,),
                  _decriptiontFormField(),
                  SizedBox(height: 10,),
                  _title("Participants"),
                  SizedBox(height: 10,),
                  _rangePicker(),
                  SizedBox(height: 30,),
                  CommonButton(content: "Add", onTap: (){
                    _AddNewTask(list);
                  })
                ],
              ),
            )
        ),
      ),
    );
  }

  _title(String text) => Row(
    children: [
    Text(text, style: Theme.of(context).textTheme.headline1),
    Text(" *", style: TextStyle(color: Colors.red, fontSize: 16),),
  ],
  );

  _titletFormField() => Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.blueGrey.withOpacity(0.2),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: TextFormField(
      controller: _titleController,
      validator: (value) {
        if (value!.isEmpty) {
          return "fill the title, please";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "fill the title"
      ),
      style: Theme.of(context).textTheme.bodyMedium,
    ),
  );

  _decriptiontFormField() => Container(
    padding: EdgeInsets.all(8),
    height: 150,
    decoration: BoxDecoration(
      color: Colors.blueGrey.withOpacity(0.2),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: TextFormField(
      controller: _decriptionController,
      validator: (value) {
        if (value!.isEmpty) {
          return "fill the decription, please";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "fill the decription"
      ),
      style: Theme.of(context).textTheme.bodyMedium,
    ),
  );

  _rangePicker() => Container(
    padding: EdgeInsets.all(8),
    height: 40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.primaryBlue.withOpacity(0.5),
    ),
    child: GestureDetector(
      onTap: () async {
        final DateTimeRange? result = await showDateRangePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2024),
        currentDate: DateTime.now(),
        saveText: "Done",
        );
        if(result != null)
          {
            print(result.start.toString());
            print(result.end.toString());
            setState((){
              _selectRange = result;
            });
          }
      },
      child: Center(child: _selectRange == null ? Text("time") : Text(dateFormat.format(_selectRange!.start) + " - " + dateFormat.format(_selectRange!.end))),
    ),
  );

  void _AddNewTask(List_Object list){
    if(_formkey.currentState!.validate()){
      widget.bloc.AddNewTaskState(list, _titleController.text, _decriptionController.text, _selectRange!)..then((value) => {
        Navigator.pop(context),
      });;
    }
  }

  @override
  // TODO: implement bloc
  TaskBloc get bloc => widget.bloc;

}