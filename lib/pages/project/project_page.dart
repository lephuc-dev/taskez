import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taskez/app.dart';
import 'package:taskez/router/router.dart';
import 'package:intl/intl.dart';
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

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  BoardViewController boardViewController = new BoardViewController();
  TextEditingController _listNameController = TextEditingController();

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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(project.image!),
              fit: BoxFit.cover,
            )
          ),
          child: StreamBuilder(
              stream:
                  bloc.getListOrderbyIndexStream(project.id.toString()),
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
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              AppElevatedButton(
                                                content: "add-ons",
                                                onTap: () {},
                                                icon: Icons.rocket_launch,
                                                buttonColor: AppColors.primaryBlue.withOpacity(0.6),
                                              ),
                                              SizedBox(width: 10,),
                                              SizedBox(
                                                height: 40,
                                                //padding: const EdgeInsets.all(8.0),
                                                child: StreamBuilder<List<ProjectParticipant>>(
                                                    stream: widget.bloc.getListProjectParticipantByProjectIdStream(project.id!),
                                                    builder: (context, parsnapshot) {
                                                      if (parsnapshot.hasData) {
                                                        return ListView.builder(
                                                            shrinkWrap: true,
                                                            scrollDirection: Axis.horizontal,
                                                            physics: const NeverScrollableScrollPhysics(),
                                                            itemCount: parsnapshot.data!.length,
                                                            itemBuilder: (context, i){
                                                              return Container(
                                                                  padding: EdgeInsets.only(left: 2, right: 2),
                                                                  child: AvatarWithName(name: parsnapshot.data![i].userId.toString(),fontSize: 12,shapeSize: 30,));
                                                            }
                                                        );
                                                      } else {
                                                        return Container();
                                                      }
                                                    }
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          // SizedBox(
                                          //   height: 40,
                                          //   //padding: const EdgeInsets.all(8.0),
                                          //   child: StreamBuilder<List<ProjectParticipant>>(
                                          //         stream: widget.bloc.getListProjectParticipantByProjectIdStream(project.id!),
                                          //         builder: (context, parsnapshot) {
                                          //           if (parsnapshot.hasData) {
                                          //             return ListView.builder(
                                          //                 shrinkWrap: true,
                                          //                 scrollDirection: Axis.horizontal,
                                          //                 physics: const NeverScrollableScrollPhysics(),
                                          //                 itemCount: parsnapshot.data!.length,
                                          //                 itemBuilder: (context, i){
                                          //                   return const AvatarWithName(name: "Hoang",fontSize: 12,shapeSize: 30,);
                                          //                 }
                                          //             );
                                          //           } else {
                                          //             return Container();
                                          //           }
                                          //         }
                                          //   ),
                                          // ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              AppElevatedButton(
                                                content: "filt",
                                                onTap: () {},
                                                icon: Icons.filter_list_sharp,
                                                buttonColor: AppColors.primaryBlue.withOpacity(0.6),
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
                                                buttonColor: AppColors.primaryBlue.withOpacity(0.6),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              AppElevatedButton(
                                                content: "add new list",
                                                onTap: () {
                                                  _showAddDialog(project.id.toString(), _listData.length + 1);
                                                },
                                                icon: Icons.list_alt_sharp,
                                                buttonColor: AppColors.primaryBlue.withOpacity(0.6),
                                              ),
                                              SizedBox(
                                                width: 5,
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
              }),
        ));
  }

  Future<void> _showAddDialog(String project_id, int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('add new list'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Name'),
                SizedBox(height: 5,),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextFormField(
                    controller: _listNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "fill the name, please";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "name of list"
                    ),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('add'),
                  onPressed: () {
                    widget.bloc.AddNewListState(project_id, _listNameController.text, index);
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(itemObject.title!, style: appTheme.textTheme.headline3,),
                  SizedBox(height: 5,),
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryGreen.withOpacity(0.2),
                      ),
                      child: Text(dateFormat.format( DateTime.fromMicrosecondsSinceEpoch(int.tryParse(itemObject.startDate!)!)) + " - " + dateFormat.format( DateTime.fromMicrosecondsSinceEpoch(int.tryParse(itemObject.endDate!)!)), style: TextStyle(fontSize: 12),)),
                ],
              ),
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
        print(_listData[oldListIndex].id.toString());
        widget.bloc.UpdateListPositionState(_listData[listIndex].id.toString(), listIndex + 1);
        widget.bloc.UpdateListPositionState(_listData[oldListIndex].id.toString(), oldListIndex + 1);
      },
      headerBackgroundColor: Color.fromARGB(255, 235, 236, 240).withOpacity(0.6),
      backgroundColor: Color.fromARGB(255, 235, 236, 240).withOpacity(0.6),
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
                      Navigator.pushNamed(context, Routes.task, arguments: {"list": list});
                    },
                    icon: Icons.add,
                    buttonColor: AppColors.primaryBlue.withOpacity(0.8),
                    iconColor: AppColors.primaryBlack1,
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
