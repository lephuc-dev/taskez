import 'package:flutter/material.dart';
import '../../../extensions/extensions.dart';
import '../../../blocs/blocs.dart';
import '../../../models/models.dart';
import '../../../resources/resources.dart';
import '../../../router/router.dart';
import '../../../widgets/widgets.dart';

class WorkspaceView extends StatefulWidget {
  final Workspace workspace;
  final HomeBloc bloc;

  const WorkspaceView({Key? key, required this.workspace, required this.bloc}) : super(key: key);

  @override
  State<WorkspaceView> createState() => _WorkspaceViewState();
}

class _WorkspaceViewState extends State<WorkspaceView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AvatarWithName(
                name: widget.workspace.name.toString()[0],
                fontSize: 16,
                shapeSize: 40,
                boxShape: BoxShape.rectangle,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  widget.workspace.name ?? "",
                  style: Theme.of(context).textTheme.headline4,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 5,
              ),
              children: [
                StreamBuilder<List<WorkspaceParticipant>>(
                    stream: widget.bloc.getWorkspacesParticipantByWorkspaceIdStream(widget.workspace.id!),
                    builder: (context, snapshot) {
                      return workspaceItem(
                        Icons.person,
                        "Members (${snapshot.data?.length ?? 0})",
                        () => showWorkspaceParticipantDialog(snapshot.data ?? []),
                      );
                    }),
                workspaceItem(
                  Icons.book,
                  "My tasks",
                  () {
                    ///TODO: Mở dialog xem nhanh danh sách task
                  },
                ),
                workspaceItem(
                  Icons.settings,
                  "Setting",
                  () {
                    ///TODO: Chuyển sang màn hình cài đặt workspace
                  },
                ),
                workspaceItem(
                  Icons.adb,
                  "Unknown",
                  () {
                    ///TODO: Chuyển cái gì đó chưa biết nữa huhu T.T
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: StreamBuilder<List<Board>>(
              stream: widget.bloc.getListBoardOfWorkspaceStream(widget.workspace.id!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length + 1,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 2.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      if (index < snapshot.data!.length) {
                        return boardWidget(
                          snapshot.data![index].name ?? "",
                          snapshot.data![index].background ?? "",
                          "1667549331948"
                        );
                      } else {
                        return workspaceItem(Icons.add, "New board", () {});
                      }
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  void showWorkspaceParticipantDialog(List<WorkspaceParticipant> listWorkspaceParticipant) {
    showDialog(
        context: context,
        builder: (context) {
          return buildWorkspaceParticipantDialog(listWorkspaceParticipant);
        });
  }

  Widget buildWorkspaceParticipantDialog(List<WorkspaceParticipant> listWorkspaceParticipant) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: AppColors.primaryWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "Workspace Participant",
                      style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 20),
                    ),
                  ),
                  ...listWorkspaceParticipant
                      .map((e) => StreamBuilder<User>(
                            stream: widget.bloc.getInformationUserByIdStream(e.userId ?? ""),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                User? user = snapshot.data;
                                return workSpaceParticipantItem(
                                  image: user?.avatar ?? "",
                                  name: user?.name ?? "",
                                  role: e.role ?? "",
                                );
                              } else {
                                return Container();
                              }
                            },
                          ))
                      .toList(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CommonButton(
                content: "CLOSE",
                buttonColor: AppColors.magnolia,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget workSpaceParticipantItem({required String image, required String name, required String role}) {
    return Column(
      children: [
        Container(
          height: 1,
          color: AppColors.darkSilver.withOpacity(0.1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (image == "")
                    AvatarWithName(
                      name: name,
                      fontSize: 14,
                      shapeSize: 40,
                      count: 2,
                    )
                  else
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.yellow,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(image),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      name,
                    ),
                  )
                ],
              ),
              Text(
                role,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget workspaceItem(IconData icon, String content, void Function() onTap) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: AppColors.primaryGray2,
      ),
      child: InkWellWrapper(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: AppColors.primaryBlack1,
                ),
                const SizedBox(width: 8),
                Text(
                  content,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: AppColors.primaryBlack1,
                        fontSize: 14,
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget boardWidget(String name, String background, String boardId) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        image: background.length > 7
            ? DecorationImage(
                image: NetworkImage(background),
                fit: BoxFit.cover,
              )
            : null,
        color: background.length == 7 ? background.toColor() : null,
      ),
      child: InkWellWrapper(
          onTap: () {
            Navigator.pushNamed(
                context,
                Routes.board,
                arguments: {
                  "board_id": boardId,
                }
            );
          },
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          child: Stack(
            children: [
              Container(color: AppColors.primaryBlack1.withOpacity(0.4)),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.headline3?.copyWith(color: AppColors.primaryWhite, fontSize: 14),
                ),
              )
            ],
          )),
    );
  }
}
