import 'package:flutter/material.dart';
import 'package:taskez/base/base.dart';
import 'package:taskez/blocs/settings/settings_bloc.dart';
import 'package:taskez/resources/colors.dart';
import 'package:taskez/router/router.dart';
import 'package:taskez/widgets/common_app_bar.dart';
import 'package:taskez/widgets/common_button.dart';

class SettingsPage extends StatefulWidget {
  final SettingsBloc bloc;

  const SettingsPage(this.bloc, {Key? key}) : super(key: key);
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends BaseState<SettingsPage, SettingsBloc> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: EdgeInsets.zero,
        child: Scaffold(
          appBar: commonAppBar(context, title: 'Settings', centerTitle: true),
          backgroundColor: AppColors.primaryWhite,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommonButton(
                      content: 'Edit Profiles',
                      onTap: (() => onEditProfilesClick()),
                    )
                  ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommonButton(
                      content: 'Change Password',
                      onTap: () =>  onChangePasswordClick(),
                    )
                  ),
              )
            ],
          ),
        ));
  }

  @override
  SettingsBloc get bloc => widget.bloc;
}
