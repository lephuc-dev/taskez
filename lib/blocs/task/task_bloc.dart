import 'package:taskez/blocs/task/task.dart';
import 'package:taskez/models/models.dart';

import '../../base/base_bloc.dart';
import '../../repositories/repositories.dart';

class TaskBloc extends BaseBloc<TaskState> {
  final TaskRepository taskRepository;

  TaskBloc(this.taskRepository);

  Future<void> AddNewTaskState(List_Object list, String title, String decription){
    return taskRepository.AddNewTaskState(list, title, decription);
  }

  @override
  void dispose() {
    super.dispose();
  }
}