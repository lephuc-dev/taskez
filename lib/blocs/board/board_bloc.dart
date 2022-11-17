import 'package:taskez/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskez/repositories/repositories.dart';
import '../../base/base.dart';
import '../blocs.dart';
import 'board_state.dart';

class BoardBloc extends BaseBloc<BoardState> {

  final BoardRepository boardRepository;

  BoardBloc(this.boardRepository);

  Stream<QuerySnapshot<dynamic>> getListTaskCardByBoardidStream(String board_id){
    return boardRepository.getListTaskCardByBoardidStream(board_id);
  }

  Stream<QuerySnapshot<dynamic>> getListListTaskByBoardidStream(String board_id){
    return boardRepository.getListListTaskByBoardidStream(board_id);
  }

  @override
  void dispose() {
    super.dispose();
  }
}