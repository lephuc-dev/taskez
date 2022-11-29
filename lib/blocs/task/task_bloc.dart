import 'package:flutter/material.dart';
import 'package:taskez/blocs/task/task.dart';
import 'package:taskez/models/models.dart';

import '../../base/base_bloc.dart';
import '../../repositories/repositories.dart';

class TaskBloc extends BaseBloc<TaskState> {
  final TaskRepository taskRepository;

  TaskBloc(this.taskRepository);

  Future<void> AddNewTaskState(List_Object list, String title, String decription, DateTimeRange time){
    return taskRepository.AddNewTaskState(list, title, decription, time);
  }

  @override
  void dispose() {
    super.dispose();
  }
}