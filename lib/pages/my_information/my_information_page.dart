import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
      appBar: commonAppBar(context, title: 'Profile'),
      backgroundColor: AppColors.primaryWhite,
      body: Padding(
        padding: const EdgeInsets.all(16),
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
                        const SizedBox(width: 16),
                        Column(
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
                      ],
                    );
                  } else {
                    return Container();
                  }
                })
          ],
        ),
      ),
    );
  }

  @override
  MyInformationBloc get bloc => widget.bloc;
}
