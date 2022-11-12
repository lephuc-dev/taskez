import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:taskez/pages/home/widgets/workspace_view.dart';

import '../../resources/resources.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'widgets/slider_menu_item.dart';

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
          slider: sliderView(),
          child: Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.backgroundDarkMode,
            child: StreamBuilder(
              stream: bloc.getWorkspacesParticipantStream(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return StreamBuilder(
                            stream: bloc.getMyWorkspacesStream(snapshot.data!.docs[i]["workspace_id"]),
                            builder: (context, AsyncSnapshot<QuerySnapshot> myWorkspaceSnapshot) {
                              if (myWorkspaceSnapshot.hasData) {
                                if (myWorkspaceSnapshot.data == null) {
                                  return const Center(
                                    child: Text("workspace in4 null"),
                                  );
                                } else {
                                  return WorkspaceView(
                                    workspaceDocument: myWorkspaceSnapshot.data!.docs[0],
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

  Widget sliderView() {
    return Container(
      color: AppColors.backgroundSliderMenuDarkMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWellWrapper(
            onTap: () {},
            splashColor: AppColors.splashInkWell.withOpacity(0.2),
            hoverColor: AppColors.splashInkWell.withOpacity(0.2),
            highlightColor: AppColors.splashInkWell.withOpacity(0.2),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: AppColors.primaryBlue,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(ImageAssets.img_phuc),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Phuc Le',
                      style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      'phuc@gmail.com',
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'View profile',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(color: AppColors.primaryGreen, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliderMenuItem(title: 'My tasks', icon: VectorImageAssets.icon_task, onTap: () {}),
          SliderMenuItem(title: 'Notifications', icon: VectorImageAssets.icon_notification, onTap: () {}),
          SliderMenuItem(title: 'Setting', icon: VectorImageAssets.icon_setting, onTap: () {}),
          SliderMenuItem(title: 'Help', icon: VectorImageAssets.icon_help, onTap: () {}),
          SliderMenuItem(title: 'Log out', icon: VectorImageAssets.icon_logout, onTap: () {})
        ],
      ),
    );
  }

  Widget _appBar() {
    return SliderAppBar(
      appBarColor: AppColors.backgroundDarkMode,
      appBarHeight: 50,
      appBarPadding: const EdgeInsets.symmetric(horizontal: 8),
      title: Text(
        "Workspaces",
        style: Theme.of(context).textTheme.headline5?.copyWith(color: AppColors.primaryWhite, fontSize: 20),
      ),
      isTitleCenter: false,
      drawerIconColor: AppColors.primaryWhite,
      trailing: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.search,
              color: AppColors.primaryWhite,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.notifications,
              color: AppColors.primaryWhite,
            ),
          ),
        ],
      ),
    );
  }

  @override
  HomeBloc get bloc => widget.bloc;
}
