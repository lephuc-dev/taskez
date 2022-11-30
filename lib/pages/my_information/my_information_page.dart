import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/edit_account_bottom_sheet.dart';
import 'widgets/option_item.dart';
import '../../models/models.dart';
import '../../router/router.dart';
import '../../widgets/widgets.dart';
import '../../resources/resources.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';

class MyInformationPage extends StatefulWidget {
  final MyInformationBloc bloc;

  const MyInformationPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<MyInformationPage> createState() => _MyInformationPageState();
}

class _MyInformationPageState extends BaseState<MyInformationPage, MyInformationBloc> {
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
            onTap: () => showEditAccountBottomSheet(),
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
      body: SingleChildScrollView(
        child: Padding(
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
              OptionItem(
                title: 'My tasks',
                icon: VectorImageAssets.icon_task,
                onTap: () {
                  ///TODO: Thêm sự kiện chuyển sang màn hình MyTasks
                },
              ),
              OptionItem(
                title: 'Notifications',
                icon: VectorImageAssets.icon_notification,
                onTap: () {
                  ///TODO: Thêm sự kiện chuyển sang màn hình Notifications
                },
              ),
              OptionItem(
                title: 'Setting',
                icon: VectorImageAssets.icon_setting,
                onTap: () {
                  ///TODO: Thêm sự kiện chuyển sang màn hình Setting
                },
              ),
              OptionItem(
                title: 'Help',
                icon: VectorImageAssets.icon_help,
                onTap: () {
                  ///TODO: Thêm sự kiện chuyển sang màn hình Help
                },
              ),
              OptionItem(
                title: 'Log out',
                icon: VectorImageAssets.icon_logout,
                onTap: () {
                  ///TODO: Thêm sự kiện đăng xuất
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void showEditAccountBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.primaryWhite,
        builder: (context) {
          return const EditAccountBottomSheet();
        });
  }

  @override
  MyInformationBloc get bloc => widget.bloc;
}
