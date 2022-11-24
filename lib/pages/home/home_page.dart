import 'package:badges/badges.dart';
import 'package:taskez/pages/notification/notification.dart';

import '../../models/models.dart';
import '../../resources/resources.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import '../../router/router.dart';
import 'widgets/workspace_view.dart';
import 'widgets/slider_menu_view.dart';

class HomePage extends StatefulWidget {
  final HomeBloc bloc;

  const HomePage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          appBar: _appBar(),
          slider: SliderMenuView(bloc),
          child: Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.primaryWhite,
            child: StreamBuilder<List<WorkspaceParticipant>>(
              stream: bloc.getWorkspacesParticipantByUidStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return StreamBuilder<Workspace>(
                            stream: bloc.getMyWorkspacesStream(
                                snapshot.data?[i].workspaceId ?? ""),
                            builder: (context, myWorkspaceSnapshot) {
                              if (myWorkspaceSnapshot.hasData) {
                                if (myWorkspaceSnapshot.data == null) {
                                  return const Center(
                                    child: Text("workspace in4 null"),
                                  );
                                } else {
                                  return WorkspaceView(
                                    workspace: myWorkspaceSnapshot.data!,
                                    bloc: bloc,
                                  );
                                }
                              } else {
                                return const Center(
                                  child: Text("No in4 workspace"),
                                );
                              }
                            });
                      });
                } else {
                  return const SpinKitFadingCircle(
                    color: AppColors.primaryWhite,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return SliderAppBar(
      appBarColor: AppColors.primaryWhite,
      appBarHeight: 50,
      appBarPadding: const EdgeInsets.symmetric(horizontal: 8),
      title: Text(
        "Workspaces",
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(color: AppColors.primaryBlack1, fontSize: 20),
      ),
      isTitleCenter: false,
      drawerIconColor: AppColors.primaryBlack1,
      trailing: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.search,
              color: AppColors.primaryBlack1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.notification),
              child: Badge(
                position: BadgePosition.topEnd(end: -8),
                shape: BadgeShape.circle,
                badgeColor: AppColors.primaryRed,
                badgeContent: const Text('3',style: TextStyle(color: AppColors.primaryWhite, fontSize: 12),),
                animationType: BadgeAnimationType.slide,
                child: const Icon(
                  Icons.notifications,
                  color: AppColors.primaryBlack1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  HomeBloc get bloc => widget.bloc;
}
