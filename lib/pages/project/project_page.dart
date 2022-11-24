import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';
import '../../resources/colors.dart';
import '../../widgets/widgets.dart';

class ProjectPage extends StatefulWidget {
  final ProjectBloc bloc;

  const ProjectPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends BaseState<ProjectPage, ProjectBloc> {
  List<List_Object> _listData = [];
  List<BoardList> _lists = [];

  BoardViewController boardViewController = new BoardViewController();

  Color caughtcolor = Colors.red;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final project = (ModalRoute.of(context)!.settings.arguments
        as Map)["project"] as Project;
    return Scaffold(
        appBar: commonAppBar(context, title: project.name),
        body: StreamBuilder(
            stream:
                bloc.getListListTaskByProjectidStream(project.id.toString()),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: StreamBuilder(
                      stream: bloc.getListTaskCardByProjectidStream(
                          project.id.toString()),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> tasksnapshot) {
                        if (tasksnapshot.hasData) {
                          _lists.clear();
                          _listData.clear();
                          snapshot.data!.docs.forEach((element) {
                            List_Object listtemp =
                                List_Object.fromDocument(element);
                            print(listtemp.id);
                            _listData.add(listtemp);
                          });
                          for (int i = 0; i < _listData.length; i++) {
                            tasksnapshot.data!.docs.forEach((taskelement) {
                              Card_Object temp =
                                  Card_Object.fromDocument(taskelement);
                              print(temp.id);
                              if (_listData[i].id == temp.listId) {
                                _listData[i].card_object?.add(temp);
                              }
                            });
                          }
                          for (int i = 0; i < _listData.length; i++) {
                            _lists.add(
                                _createBoardList(_listData[i]) as BoardList);
                          }
                          return Container(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryBlue
                                            .withOpacity(0.1)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            AppElevatedButton(
                                              content: "add-ons",
                                              onTap: () {},
                                              icon: Icons.rocket_launch,
                                              buttonColor: AppColors.primaryBlue
                                                  .withOpacity(0.2),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            AppElevatedButton(
                                              content: "filt",
                                              onTap: () {},
                                              icon: Icons.filter_list_sharp,
                                              buttonColor: AppColors.primaryBlue
                                                  .withOpacity(0.2),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            AppElevatedButton(
                                              content: "refresh",
                                              onTap: () {
                                                _lists.clear();
                                                _listData.clear();
                                                snapshot.data!.docs
                                                    .forEach((element) {
                                                  List_Object listtemp =
                                                      List_Object.fromDocument(
                                                          element);
                                                  _listData.add(listtemp);
                                                });
                                                for (int i = 0;
                                                    i < _listData.length;
                                                    i++) {
                                                  tasksnapshot.data!.docs
                                                      .forEach((taskelement) {
                                                    Card_Object temp =
                                                        Card_Object
                                                            .fromDocument(
                                                                taskelement);
                                                    if (_listData[i].id ==
                                                        temp.listId) {
                                                      _listData[i]
                                                          .card_object
                                                          ?.add(temp);
                                                    }
                                                  });
                                                }
                                                _lists.clear();
                                                for (int i = 0;
                                                    i < _listData.length;
                                                    i++) {
                                                  _lists.add(_createBoardList(
                                                          _listData[i])
                                                      as BoardList);
                                                }
                                              },
                                              icon: Icons.refresh_sharp,
                                              buttonColor: AppColors.primaryBlue
                                                  .withOpacity(0.2),
                                            ),
                                          ],
                                        )
                                      ],
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
                        } else {
                          return Center(
                            child: Text("a"),
                          );
                        }
                      }),
                );
              } else {
                return Center(
                  child: Text("error"),
                );
              }
            }));
  }

  Widget buildBoardItem(Card_Object itemObject) {
    return BoardItem(
        onStartDragItem:
            (int? listIndex, int? itemIndex, BoardItemState? state) {},
        onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
            int? oldItemIndex, BoardItemState? state) {
          //Used to update our local item data
          var item = _listData[oldListIndex!].card_object![oldItemIndex!];
          print("list" + _listData[listIndex!].id.toString());
          widget.bloc.UpdateTaskState(
              item.id.toString(), _listData[listIndex!].id.toString());
          _listData[oldListIndex].card_object!.removeAt(oldItemIndex!);
          _listData[listIndex!].card_object!.insert(itemIndex!, item);
        },
        onTapItem:
            (int? listIndex, int? itemIndex, BoardItemState? state) async {},
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
      onStartDragList: (int? listIndex) {},
      onTapList: (int? listIndex) async {},
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
                    onTap: () {
                      // Navigator.pushNamedAndRemoveUntil(context, Routes.task, (route) => false);
                    },
                    icon: Icons.add,
                    buttonColor: AppColors.primaryBlue.withOpacity(0.7),
                    iconColor: AppColors.primaryWhite,
                  )
                ],
              )),
        ),
      ],
      items: items,
    );
  }

  @override
  ProjectBloc get bloc => widget.bloc;
}
