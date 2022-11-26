import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../models/models.dart';
import '../../../blocs/blocs.dart';
import '../../../resources/resources.dart';
import '../../../widgets/widgets.dart';
import '../../../enums/enums.dart';
import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final NotificationBloc bloc;
  final String type;
  const TabBarItem({Key? key, required this.bloc, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        type == 'all'
            ? StreamBuilder<List<NotificationModel>>(
                stream: bloc
                    .getAllNotificationsByUidStream(bloc.getCurrentUserId()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, i) {
                            return StreamBuilder<User>(
                                stream: bloc.getInformationUserStream(
                                    snapshot.data?[i].notifyerId ?? ""),
                                builder: (context, userSnapshot) {
                                  if (userSnapshot.hasData) {
                                    if (userSnapshot.data == null) {
                                      return const Center(
                                        child: Text("user in4 null"),
                                      );
                                    } else {
                                      return NotifyComponent(
                                        user: userSnapshot.data?.name ?? "",
                                        card: snapshot.data?[i].card ?? "",
                                        objectchange:
                                            snapshot.data?[i].objectchange ??
                                                "",
                                        type: getType(
                                            snapshot.data?[i].type ?? ""),
                                        time: snapshot.data?[i].time ?? "",
                                        board: snapshot.data?[i].board ?? "",
                                        avt: userSnapshot.data?.avatar ?? "",
                                        seen: snapshot.data?[i].seen ?? false,
                                        onTap: () => {},
                                      );
                                    }
                                  } else {
                                    return const Center(
                                      child: Text("No user found"),
                                    );
                                  }
                                });
                          }),
                    );
                  } else {
                    return const SpinKitFadingCircle(
                      color: AppColors.primaryWhite,
                    );
                  }
                })
            : StreamBuilder<List<NotificationModel>>(
                stream: bloc.getNotificationsByUidandTypeStream(
                    bloc.getCurrentUserId(), type),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, i) {
                            return StreamBuilder<User>(
                                stream: bloc.getInformationUserStream(
                                    snapshot.data?[i].notifyerId ?? ""),
                                builder: (context, userSnapshot) {
                                  if (userSnapshot.hasData) {
                                    if (userSnapshot.data == null) {
                                      return const Center(
                                        child: Text("user in4 nulla"),
                                      );
                                    } else {
                                      if (type == 'invite') {
                                        return StreamBuilder<Project>(
                                            stream: bloc.getProjectStream(
                                                snapshot.data?[i].workspaceId ??
                                                    ""),
                                            builder:
                                                (context, workspaceSnapshot) {
                                              if (workspaceSnapshot.hasData) {
                                                if (workspaceSnapshot.data ==
                                                    null) {
                                                  return const Center(
                                                    child: Text(
                                                        "workspace in4 nulla"),
                                                  );
                                                } else {
                                                  return NotifyComponent(
                                                    user: userSnapshot
                                                            .data?.name ??
                                                        "",
                                                    type: getType(snapshot
                                                            .data?[i].type ??
                                                        ""),
                                                    time: snapshot
                                                            .data?[i].time ??
                                                        "",
                                                    project: workspaceSnapshot
                                                            .data?.name ??
                                                        "",
                                                    avt: userSnapshot
                                                            .data?.avatar ??
                                                        "",
                                                    seen: getStatus(snapshot
                                                            .data?[i].status ??
                                                        ""),
                                                    onTap: () => {},
                                                  );
                                                }
                                              } else {
                                                return const Center(
                                                  child:
                                                      Text("No in4 workspace"),
                                                );
                                              }
                                            });
                                      } else {
                                        return NotifyComponent(
                                          user: userSnapshot.data?.name ?? "",
                                          type: getType(
                                              snapshot.data?[i].type ?? ""),
                                          card: snapshot.data?[i].card ?? "",
                                          board: snapshot.data?[i].board ?? "",
                                          time: snapshot.data?[i].time ?? "",
                                          avt: userSnapshot.data?.avatar ?? "",
                                          seen: snapshot.data?[i].seen ?? false,
                                          onTap: () => {},
                                        );
                                      }
                                    }
                                  } else {
                                    return const Center(
                                      child: Text("No user found"),
                                    );
                                  }
                                });
                          }),
                    );
                  } else {
                    return const SpinKitFadingCircle(
                      color: AppColors.primaryWhite,
                    );
                  }
                })
      ],
    );
  }

  getType(String type) {
    switch (type) {
      case 'expired':
        return Type.expired;
      case 'add':
        return Type.add;
      case 'move':
        return Type.move;
      case 'change':
        return Type.change;
      default:
        return Type.invite;
    }
  }

  getStatus(String status) {
    if (status == 'pending') {
      return false;
    }
    return true;
  }
}
