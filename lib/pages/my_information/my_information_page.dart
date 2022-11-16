import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskez/models/models.dart';
import 'widgets/listView_item.dart';
import 'widgets/statistic.dart';
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

class _MyInformationPageState
    extends BaseState<MyInformationPage, MyInformationBloc> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _firebaseAuth = FirebaseAuth.instance;
    final _fireStore = FirebaseFirestore.instance.collection("USERS");
    final user = _firebaseAuth.currentUser;

    return FutureBuilder<DocumentSnapshot>(
        future: _fireStore.doc(user?.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            UserModel data = UserModel.fromJson(
                snapshot.data!.data() as Map<String, Object?>);
            return SafeArea(
              minimum: EdgeInsets.zero,
              child: Scaffold(
                appBar:
                    commonAppBar(context, title: 'Profiles', centerTitle: true),
                backgroundColor: AppColors.backgroundWhite,
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    children: const <Widget>[
                                      Icon(Icons.settings),
                                    ]),
                                ListTile(
                                  leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://www.tsn.ca/polopoly_fs/1.1849366.1663273564!/fileimage/httpImage/image.jpg_gen/derivatives/landscape_620/cristiano-ronaldo.jpg'),
                                      radius: 32),
                                  title: Text("${data.name}",
                                      style: TextStyle(fontSize: 22)),
                                  subtitle: Text(
                                    "${data.email}",
                                    style:
                                        TextStyle(color: AppColors.primaryGrey),
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
                                                        AppColors.primaryWhite,
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
                                                        AppColors.primaryWhite,
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
                              ListViewItem(),
                              ListViewItem(),
                              ListViewItem(),
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
                    ]),
              ),
            );
          }
          return Text("loading");
        });
  }

  @override
  MyInformationBloc get bloc => widget.bloc;
}
