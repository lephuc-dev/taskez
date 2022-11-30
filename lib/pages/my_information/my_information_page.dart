import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/models.dart';
import '../../router/router.dart';
import '../../widgets/widgets.dart';
import '../../resources/resources.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';
import 'widgets/slider_menu_item.dart';

class MyInformationPage extends StatefulWidget {
  final MyInformationBloc bloc;

  const MyInformationPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<MyInformationPage> createState() => _MyInformationPageState();
}

class _MyInformationPageState extends BaseState<MyInformationPage, MyInformationBloc> {
  void onChangePasswordClick() {
    Navigator.pushNamed(context, Routes.changePassword);
  }

  void onEditProfilesClick() {
    Navigator.pushNamed(context, Routes.editProfiles);
  }

  void onChangeAvatarClick() {
    Navigator.pushNamed(context, Routes.changeAvatar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 20),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.primaryWhite,
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Center(
                child: Text(
                  "Edit account",
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 14, color: AppColors.primaryGreen),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.primaryWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<User>(
                stream: widget.bloc.getInformationUserStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (snapshot.data?.avatar == "")
                          AvatarWithName(
                            name: snapshot.data?.name ?? "?",
                            fontSize: 20,
                            shapeSize: 70,
                            count: 2,
                          )
                        else
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: AppColors.yellow,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(snapshot.data?.avatar ?? ""),
                            ),
                          ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data?.name ?? "Unknown",
                                style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  snapshot.data?.email ?? "Unknown",
                                  style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: SvgPicture.asset(VectorImageAssets.img_covid_banner),
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

  @override
  MyInformationBloc get bloc => widget.bloc;
}
