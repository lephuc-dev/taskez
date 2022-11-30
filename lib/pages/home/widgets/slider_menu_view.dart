import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../blocs/blocs.dart';
import '../../../models/models.dart';
import '../../../resources/resources.dart';
import '../../../router/router.dart';
import '../../../widgets/widgets.dart';
import 'slider_menu_item.dart';

class SliderMenuView extends StatefulWidget {
  final HomeBloc bloc;

  const SliderMenuView(this.bloc, {Key? key}) : super(key: key);

  @override
  State<SliderMenuView> createState() => _SliderMenuViewState();
}

class _SliderMenuViewState extends State<SliderMenuView> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Container(
        color: AppColors.primaryWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWellWrapper(
              onTap: () => Navigator.pushNamed(context, Routes.myInformation),
              splashColor: AppColors.splashInkWell.withOpacity(0.2),
              hoverColor: AppColors.splashInkWell.withOpacity(0.2),
              highlightColor: AppColors.splashInkWell.withOpacity(0.2),
              child: StreamBuilder<User>(
                  stream: widget.bloc.getInformationUserStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (snapshot.data?.avatar == "")
                              AvatarWithName(
                                name: snapshot.data?.name ?? "?",
                                fontSize: 20,
                                shapeSize: 90,
                                count: 2,
                              )
                            else
                              CircleAvatar(
                                radius: 45,
                                backgroundColor: AppColors.yellow,
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(snapshot.data?.avatar ?? ""),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                snapshot.data?.name ?? "Unknown",
                                style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                snapshot.data?.email ?? "Unknown",
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
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
            Container(
              height: 1,
              color: AppColors.primaryGray1.withOpacity(0.2),
            ),
            SliderMenuItem(
              title: 'My tasks',
              icon: VectorImageAssets.icon_task,
              onTap: () {
                ///TODO: Thêm sự kiện chuyển sang màn hình MyTasks
              },
            ),
            SliderMenuItem(
              title: 'Notifications',
              icon: VectorImageAssets.icon_notification,
              onTap: () {
                ///TODO: Thêm sự kiện chuyển sang màn hình Notifications
              },
            ),
            SliderMenuItem(
              title: 'Setting',
              icon: VectorImageAssets.icon_setting,
              onTap: () {
                ///TODO: Thêm sự kiện chuyển sang màn hình Setting
              },
            ),
            SliderMenuItem(
              title: 'Help',
              icon: VectorImageAssets.icon_help,
              onTap: () {
                ///TODO: Thêm sự kiện chuyển sang màn hình Help
              },
            ),
            SliderMenuItem(
              title: 'Log out',
              icon: VectorImageAssets.icon_logout,
              onTap: () {
                ///TODO: Thêm sự kiện đăng xuất
              },
            )
          ],
        ),
      ),
    );
  }
}
