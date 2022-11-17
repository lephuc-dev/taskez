import 'package:equatable/equatable.dart';
import '../../models/models.dart';

class BoardState extends Equatable {
  final List<List_Object>? list;

  BoardState({BoardState? state, final List<List_Object>? list}) :
        list = list ?? state?.list;

  @override
  List<Object?> get props => [list];
}