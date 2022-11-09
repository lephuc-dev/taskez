import 'package:flutter/material.dart';
import 'package:taskez/pages/my_information/widgets/listView_item.dart';
import 'package:taskez/pages/my_information/widgets/statistic.dart';
import 'package:taskez/widgets/widgets.dart';
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
      minimum: EdgeInsets.zero,
      child: Scaffold(
        appBar: commonAppBar(context, title: 'Profiles', centerTitle: true),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const <Widget>[
                              Icon(Icons.settings),
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
                            style: TextStyle(color: AppColors.primaryGrey),
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
                                  style:
                                      TextStyle(color: AppColors.primaryGrey),
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
                                  style:
                                      TextStyle(color: AppColors.primaryGrey),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                'Statistic',
                                style: TextStyle(
                                    color: AppColors.primaryBlack1,
                                    fontSize: 22),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const <Widget>[
                              Statistic(
                                name: 'Events',
                                progress: '60%',
                              ),
                              Statistic(name: 'To do', progress: '40%'),
                              Statistic(name: 'Quick Notes', progress: '80%'),
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

  @override
  MyInformationBloc get bloc => widget.bloc;
}
