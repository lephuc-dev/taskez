import 'package:badges/badges.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import '../../models/models.dart';
import '../../blocs/blocs.dart';
import '../../base/base.dart';
import '../../resources/colors.dart';
import '../../resources/resources.dart';
import '../../widgets/widgets.dart';
import '../../enums/enums.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  final NotificationBloc bloc;

  const NotificationPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState
    extends BaseState<NotificationPage, NotificationBloc>
    with SingleTickerProviderStateMixin {
  final _firebaseAuth = fbAuth.FirebaseAuth.instance;

  String getCurrentUserId() {
    return _firebaseAuth.currentUser?.uid ?? "";
  }

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              labelColor: AppColors.primaryBlack1,
              indicatorColor: AppColors.yellow,
              tabs: [
                Tab(
                  text: 'Tất cả',
                  icon: Badge(
                    position: BadgePosition.topEnd(end: -8),
                    shape: BadgeShape.circle,
                    badgeColor: AppColors.primaryRed,
                    badgeContent: const Text(
                      '2',
                      style: TextStyle(
                          color: AppColors.primaryWhite, fontSize: 12),
                    ),
                    animationType: BadgeAnimationType.slide,
                    child: const FaIcon(
                      FontAwesomeIcons.bell,
                      color: AppColors.primaryBlack1,
                    ),
                  ),
                ),
                Tab(
                  text: 'Hết hạn',
                  icon: Badge(
                    position: BadgePosition.topEnd(end: -8),
                    shape: BadgeShape.circle,
                    badgeColor: AppColors.primaryRed,
                    showBadge: false,
                    badgeContent: const Text(
                      '3',
                      style: TextStyle(
                          color: AppColors.primaryWhite, fontSize: 12),
                    ),
                    animationType: BadgeAnimationType.slide,
                    child: const FaIcon(
                      FontAwesomeIcons.clockRotateLeft,
                      color: AppColors.primaryBlack1,
                    ),
                  ),
                ),
                Tab(
                    text: 'Lời mời',
                    icon: Badge(
                      position: BadgePosition.topEnd(end: -8),
                      shape: BadgeShape.circle,
                      badgeColor: AppColors.primaryRed,
                      badgeContent: const Text(
                        '1',
                        style: TextStyle(
                            color: AppColors.primaryWhite, fontSize: 12),
                      ),
                      animationType: BadgeAnimationType.slide,
                      child: const FaIcon(
                        FontAwesomeIcons.envelopesBulk,
                        color: AppColors.primaryBlack1,
                      ),
                    )),
              ],
            ),
            automaticallyImplyLeading: true,
            backgroundColor: AppColors.primaryWhite,
            iconTheme: const IconThemeData(color: AppColors.primaryBlack1),
            elevation: 0,
            title: titleAppbar(context),
          ),
          body: TabBarView(controller: _tabController, children: [
            tabBarView(context, 'all'),
            tabBarView(context, 'expired'),
            tabBarView(context, 'invite'),
          ])),
    ));
  }

  Widget titleAppbar(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const FaIcon(
          FontAwesomeIcons.xmark,
        ),
      ),
      Text(
        'Thông báo',
        style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 20),
      ),
      Row(
        children: [
          Container(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05),
            child: const FaIcon(FontAwesomeIcons.squareCheck),
          ),
          const FaIcon(FontAwesomeIcons.ellipsisVertical)
        ],
      )
    ]);
  }

  Widget tabBarView(BuildContext context, String type) {
    return Column(
      children: [
        type == 'all'
            ? StreamBuilder<List<NotificationModel>>(
                stream: widget.bloc
                    .getAllNotificationsByUidStream(getCurrentUserId()),
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
                stream: widget.bloc.getNotificationsByUidandTypeStream(
                    getCurrentUserId(), type),
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
                                        return StreamBuilder<Workspace>(
                                            stream: bloc.getMyWorkspacesStream(
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

  @override
  NotificationBloc get bloc => widget.bloc;

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
