import 'package:flutter/material.dart';
import 'widgets/task_item.dart';
import 'widgets/edit_account_bottom_sheet.dart';
import 'widgets/option_item.dart';
import '../../models/models.dart';
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
        elevation: 0.5,
        backgroundColor: AppColors.primaryWhite,
      ),
      backgroundColor: AppColors.primaryWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder<User>(
                  stream: widget.bloc.getInformationUserStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (snapshot.data?.avatar == "")
                            AvatarWithName(
                              name: snapshot.data?.name ?? "?",
                              fontSize: 20,
                              shapeSize: 50,
                              count: 2,
                            )
                          else
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: AppColors.primaryBlack1,
                              child: CircleAvatar(
                                radius: 49,
                                backgroundImage: NetworkImage(snapshot.data?.avatar ?? ""),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
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
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: CommonButton(
                  content: "Edit your account",
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  textStyle: Theme.of(context).textTheme.button?.copyWith(fontSize: 14),
                  onTap: () => showEditAccountBottomSheet(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your task",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 2.0,
                  ),
                  children: const [
                    TaskItem(
                      color: AppColors.primaryBlue,
                      name: "No expiration date",
                      amount: 0,
                    ),
                    TaskItem(
                      color: AppColors.primaryGreen,
                      name: "Out of date",
                      amount: 0,
                    ),
                    TaskItem(
                      color: AppColors.yellow,
                      name: "Expires next week",
                      amount: 0,
                    ),
                    TaskItem(
                      color: AppColors.primaryRed,
                      name: "Expires next month",
                      amount: 0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Other",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
              OptionItem(
                title: 'Setting',
                icon: VectorImageAssets.ic_setting,
                onTap: () {
                  ///TODO: Thêm sự kiện chuyển sang màn hình MyTasks
                },
              ),
              OptionItem(
                title: 'Help',
                icon: VectorImageAssets.ic_help,
                onTap: () {
                  ///TODO: Thêm sự kiện chuyển sang màn hình MyTasks
                },
              ),
              OptionItem(
                title: 'Log out',
                icon: VectorImageAssets.ic_logout,
                onTap: () {
                  ///TODO: Thêm sự kiện chuyển sang màn hình MyTasks
                },
              ),
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
