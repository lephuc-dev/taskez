import 'package:flutter/material.dart';
import '../../widgets/common_button.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: AppColors.backgroundWhite),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(Icons.settings),
                                  SizedBox(
                                    width: 10,
                                  )
                                ]),
                            const ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://www.tsn.ca/polopoly_fs/1.1849366.1663273564!/fileimage/httpImage/image.jpg_gen/derivatives/landscape_620/cristiano-ronaldo.jpg'),
                                  radius: 32),
                              title: Text('Thành Quang',
                                  style: TextStyle(fontSize: 22)),
                              subtitle: Text(
                                'gido@gmail.com',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Text('120', style: TextStyle(fontSize: 22)),
                                    Text(
                                      'Create Tasks',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Text('80', style: TextStyle(fontSize: 22)),
                                    Text(
                                      'Completed Tasks',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: AppColors.primaryRed,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0),
                              )),
                          child: SizedBox(
                              width: 160,
                              height: 100,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const <Widget>[
                                      Text(
                                        'Events',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 22),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        '12 Tasks',
                                        style: TextStyle(
                                            color: AppColors.primaryWhite,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: AppColors.primaryBlue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0),
                              )),
                          child: SizedBox(
                              width: 160,
                              height: 100,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const <Widget>[
                                      Text(
                                        'To do Tasks',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 22),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        '12 Tasks',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      child: SizedBox(
                          height: 205,
                          width: 343,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Text(
                                    'Statistic',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 22),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(50.0),
                                              topRight: Radius.circular(50.0),
                                              bottomLeft: Radius.circular(50.0),
                                              bottomRight:
                                                  Radius.circular(50.0),
                                            )),
                                        child: SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const <Widget>[
                                              Text(
                                                '60%',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 22),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'Events',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(50.0),
                                              topRight: Radius.circular(50.0),
                                              bottomLeft: Radius.circular(50.0),
                                              bottomRight:
                                                  Radius.circular(50.0),
                                            )),
                                        child: SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const <Widget>[
                                              Text(
                                                '60%',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 22),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'To do',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(50.0),
                                              topRight: Radius.circular(50.0),
                                              bottomLeft: Radius.circular(50.0),
                                              bottomRight:
                                                  Radius.circular(50.0),
                                            )),
                                        child: SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const <Widget>[
                                              Text(
                                                '60%',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 22),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'Quick Notes',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }

  @override
  MyInformationBloc get bloc => widget.bloc;
}
