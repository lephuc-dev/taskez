import 'package:equatable/equatable.dart';
import '../../models/models.dart';

class TaskState extends Equatable {
  final List<Card_Object>? list;

  TaskState({TaskState? state, final List<Card_Object>? list}) :
        list = list ?? state?.list;

  @override
  List<Object?> get props => [list];
}
