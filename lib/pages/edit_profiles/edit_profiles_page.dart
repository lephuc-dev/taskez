import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taskez/base/base.dart';
import 'package:taskez/blocs/edit_profiles/edit_prodfiles.dart';
import 'package:taskez/enums/enums.dart';
import 'package:taskez/resources/colors.dart';
import 'package:taskez/router/router.dart';
import 'package:taskez/widgets/widgets.dart';

class EditProfilesPage extends StatefulWidget {
  final EditProfilesBloc bloc;

  const EditProfilesPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<EditProfilesPage> createState() => _EditProfilesState();
}

class _EditProfilesState extends BaseState<EditProfilesPage, EditProfilesBloc> {
  @override
  void initState() {
    super.initState();
    final doc = bloc.profilesRepository.getUser();
    doc.then((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      nameTextController.text = data["name"];
    });
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController nameTextController = TextEditingController();

  void onUpdateUserClick() {
    if (formKey.currentState?.validate() == true) {
      String name = nameTextController.text.toString().trim();
      bloc.profilesRepository.updateUser(
          name, () => onUpdateSuccess(), (error) => onUpdateError(error));
    }
  }

  void onUpdateSuccess() {
    showDialog(
      context: context,
      builder: (context) {
        return CommonDialog(
          title: "Update User Failed",
          description: "Success!",
          contentButton: "Close",
          onTap: () => {
            Navigator.pop(context),
            Navigator.pop(context),
          },
        );
      },
    );
  }

  void onUpdateError(String error) {
    showDialog(
      context: context,
      builder: (context) {
        return CommonDialog(
          title: "Update User Failed",
          description: error,
          contentButton: "Close",
          onTap: () => Navigator.pop(context),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Scaffold(
          appBar:
              commonAppBar(context, title: 'Edit Profiles', centerTitle: true),
          backgroundColor: AppColors.primaryWhite,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: Text(
                    "Change your name",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontSize: 20),
                  ),
                ),
                CommonTextField(
                    textEditingController: nameTextController,
                    hintText: "Enter your new name",
                    textInputType: TextInputType.text,
                    validatorStyle: ValidatorStyle.text),
                Padding(
                  padding: EdgeInsets.only(top: 64.0),
                  child: CommonButton(
                    content: 'Save',
                    onTap: () => onUpdateUserClick(),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  EditProfilesBloc get bloc => widget.bloc;
}
