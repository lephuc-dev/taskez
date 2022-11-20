import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:boardview/boardview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskez/models/list_card_model.dart';
import 'package:taskez/models/task_card_model.dart';
import 'package:taskez/repositories/repositories.dart';
import 'package:taskez/theme/theme.dart';
import 'package:taskez/widgets/elevated_button.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';
import '../../resources/resources.dart';
import '../../router/router.dart';

class BoardPage extends StatefulWidget {
  final BoardBloc bloc;

  const BoardPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends BaseState<BoardPage, BoardBloc> {

  List<List_Object> _listData = [];

  BoardViewController boardViewController = new BoardViewController();

  Color caughtcolor = Colors.red;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final board_id =  (ModalRoute.of(context)!.settings.arguments as Map)["board_id"] as String;
    _listData.clear();
    // List<BoardList> _lists = [];
    // for (int i = 0; i < _listData.length; i++) {
    //   _lists.add(_createBoardList(_listData[i]) as BoardList);
    // }
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.primaryChathamsBlue.withOpacity(0.9),
            appBar: _appBarBoardView(),
            body: StreamBuilder(
              stream: bloc.getListListTaskByBoardidStream(board_id),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(snapshot.hasData) {
                  _listData.clear();
                  snapshot.data!.docs.forEach((element) {
                    List_Object listtemp = List_Object.fromDocument(element);
                    _listData.add(listtemp);
                  });
                  return Container(
                    child: StreamBuilder(
                        stream: bloc.getListTaskCardByBoardidStream(board_id),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> tasksnapshot) {
                          if (tasksnapshot.hasData) {

                            for (int i = 0; i < _listData.length; i++) {
                              tasksnapshot.data!.docs.forEach((taskelement) {
                                Card_Object temp = Card_Object.fromDocument(taskelement);
                                if (_listData[i].id == temp.listId) {
                                  _listData[i].card_object?.add(temp);
                                }
                              });
                            }
                            List<BoardList> _lists = [];
                            for (int i = 0; i < _listData.length; i++) {
                              _lists.add(_createBoardList(_listData[i]) as BoardList);
                            }
                            return Container(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryChathamsBlue.withOpacity(0.1)
                                      ),
                                    ),
                                    Expanded(
                                      child: BoardView(
                                        lists: _lists,
                                        boardViewController: boardViewController,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          else {
                            return Center(child: Text("a"),);
                          }
                        }
                    ),
                  );
                }
                else{
                  return Center(child: Text("error"),);
                }
              }
            )
          )
    );
  }

  Widget buildBoardItem(Card_Object itemObject) {
    return BoardItem(
        onStartDragItem: (int? listIndex, int? itemIndex, BoardItemState? state) {

        },
        onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
            int? oldItemIndex, BoardItemState? state) {
          //Used to update our local item data
          var item = _listData[oldListIndex!].card_object![oldItemIndex!];
          _listData[oldListIndex].card_object!.removeAt(oldItemIndex!);
          _listData[listIndex!].card_object!.insert(itemIndex!, item);
        },
        onTapItem: (int? listIndex, int? itemIndex, BoardItemState? state) async {

        },
        item: Container(
          margin: EdgeInsets.only(left: 4, right: 4),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(itemObject.title!),
            ),
          ),
        ));
  }

  Widget _createBoardList(List_Object list) {
    List<BoardItem> items = [];
    for (int i = 0; i < list.card_object!.length; i++) {
      items.insert(i, buildBoardItem(list.card_object![i]) as BoardItem);
    }

    return BoardList(
      onStartDragList: (int? listIndex) {

      },
      onTapList: (int? listIndex) async {

      },
      onDropList: (int? listIndex, int? oldListIndex) {
        //Update our local list data
        var list = _listData[oldListIndex!];
        _listData.removeAt(oldListIndex!);
        _listData.insert(listIndex!, list);
      },
      headerBackgroundColor: Color.fromARGB(255, 235, 236, 240),
      backgroundColor: Color.fromARGB(255, 235, 236, 240),
      header: [
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    list.name!,
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  AppElevatedButton(
                    content: "Add",
                    onTap: (){
                      _listData.clear();
                      Navigator.pushNamedAndRemoveUntil(context, Routes.task, (route) => false);
                      },
                    icon: Icons.add,buttonColor: AppColors.primaryCreamyGreen.withOpacity(0.7),
                    iconColor: AppColors.primaryWhite,)
                ],
              )
          ),
        ),
      ],
      items: items,

    );
  }

  PreferredSizeWidget _appBarBoardView() {
    return  AppBar(
      title: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: AppColors.primaryBlue,
          ),
          Text(
            'TASKEZ',
            style: AppThemes().lightTheme.textTheme.headlineLarge,
          ),

        ],
      ),
    );
  }

  @override
  // TODO: implement bloc
  BoardBloc get bloc => widget.bloc;
}