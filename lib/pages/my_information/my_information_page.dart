import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:taskez/models/models.dart';
import 'package:taskez/router/router.dart';
import '../../widgets/widgets.dart';
import '../../resources/resources.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';
import 'widgets/statistic.dart';
import 'widgets/task_item.dart';

class MyInformationPage extends StatefulWidget {
  final MyInformationBloc bloc;

  const MyInformationPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<MyInformationPage> createState() => _MyInformationPageState();
}

class _MyInformationPageState
    extends BaseState<MyInformationPage, MyInformationBloc> {
  @override
  void initState() {
    super.initState();
  }

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
    return SafeArea(
      minimum: EdgeInsets.zero,
      child: Scaffold(
          appBar: commonAppBar(context, title: 'Profiles', centerTitle: true),
          backgroundColor: AppColors.backgroundWhite,
          body: StreamBuilder<User>(
            stream: widget.bloc.getInformationUserStream(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: SpinKitFadingCircle(color: AppColors.primaryBlue),
                );
              } else {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Column(
                                                    crossAxisAlignment:CrossAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 24,
                                                                right: 24,
                                                                top: 64),
                                                        child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: CommonButton(
                                                              buttonColor: AppColors.primaryBlue,
                                                              content:'Edit Profiles',
                                                              onTap: (() => onEditProfilesClick()),
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 24,
                                                                right: 24,
                                                                top: 8,
                                                                bottom: 8),
                                                        child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: CommonButton(
                                                              buttonColor: AppColors.primaryBlue,
                                                              content: 'Change Password',
                                                              onTap: () => onChangePasswordClick(),
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 24,
                                                                right: 24,
                                                                top: 8,
                                                                bottom: 8),
                                                        child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: CommonButton(
                                                              buttonColor: AppColors.primaryBlue,
                                                              content: 'Change Avatar',
                                                              onTap: () => onChangeAvatarClick(),
                                                            )),
                                                      )
                                                    ],
                                                  );
                                                });
                                          },
                                          icon: const Icon(Icons.settings)),
                                    ]),
                                ListTile(
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if (snapshot.data?.avatar == "")
                                        AvatarWithName(
                                          name: snapshot.data?.name ?? "?",
                                          fontSize: 20,
                                          shapeSize: 56,
                                          count: 2,
                                        )
                                      else
                                        CircleAvatar(
                                          radius: 28,
                                          backgroundColor: AppColors.yellow,
                                          child: CircleAvatar(
                                            radius: 28,
                                            backgroundImage: NetworkImage(
                                                snapshot.data?.avatar ?? ""),
                                          ),
                                        ),
                                    ],
                                  ),
                                  title: Text(snapshot.data!.name ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.copyWith(
                                              color: AppColors.primaryBlack1,
                                              fontSize: 20)),
                                  subtitle: Text(
                                    snapshot.data!.email ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            color: AppColors.primaryGrey,
                                            fontSize: 18),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('120',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                ?.copyWith(
                                                    color:
                                                        AppColors.primaryBlack1,
                                                    fontSize: 20)),
                                        Text(
                                          'Create Tasks',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                  color: AppColors.primaryGrey),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('80',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                ?.copyWith(
                                                    color:
                                                        AppColors.primaryBlack1,
                                                    fontSize: 20)),
                                        Text(
                                          'Completed Tasks',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                  color: AppColors.primaryGrey),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
                        child: SizedBox(
                          height: 100,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: const <Widget>[
                              TaskItem(),
                              TaskItem(),
                              TaskItem(),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 24, top: 16),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Statistic',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.copyWith(
                                                  color:
                                                      AppColors.primaryBlack1,
                                                  fontSize: 22)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      Statistic(
                                        name: 'Events',
                                        progress: '60%',
                                      ),
                                      Statistic(name: 'To do', progress: '40%'),
                                      Statistic(
                                          name: 'Quick Notes', progress: '80%'),
                                    ],
                                  )
                                ],
                              )),
                        ),
                      )
                    ]);
              }
            },
          )),
    );
  }

  @override
  MyInformationBloc get bloc => widget.bloc;
}
