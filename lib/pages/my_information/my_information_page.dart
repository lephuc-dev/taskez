import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

  void onSettingsClick() {
    Navigator.pushNamed(
        context, Routes.settings);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.zero,
      child: Scaffold(
          appBar: commonAppBar(context, title: 'Profiles', centerTitle: true),
          backgroundColor: AppColors.backgroundWhite,
          body: StreamBuilder<QuerySnapshot>(
            stream: widget.bloc.getUserStream(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                          onPressed: () => onSettingsClick(),
                                          icon: const Icon(Icons.settings))
                                    ]),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 32,
                                    backgroundImage: NetworkImage(
                                        snapshot.data!.docs[0]["avatar"]),
                                    child: Text(snapshot.data!.docs[0]["name"].toString().characters.first),
                                  ),
                                  title: Text(snapshot.data!.docs[0]["name"],
                                      style: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                ?.copyWith(
                                                    color:
                                                        AppColors.primaryBlack1,
                                                    fontSize: 22)),
                                  subtitle: Text(
                                    snapshot.data!.docs[0]["email"],
                                    style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                ?.copyWith(
                                                    color:
                                                        AppColors.primaryGrey,
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
                                                    fontSize: 22)),
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
                                                    fontSize: 22)),
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
