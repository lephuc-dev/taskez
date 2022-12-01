import 'package:flutter/material.dart';
import '../../base/base.dart';
import '../../enums/enums.dart';
import '../../resources/colors.dart';
import '../../widgets/widgets.dart';
import '../../blocs/blocs.dart';

class EditProfilesPage extends StatefulWidget {
  final EditProfileBloc bloc;

  const EditProfilesPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<EditProfilesPage> createState() => _EditProfilesState();
}

class _EditProfilesState extends BaseState<EditProfilesPage, EditProfileBloc> {
  @override
  void initState() {
    super.initState();
    bloc.getInformationUserStream().first.then((value) {
      nameTextController.text = value.name ?? "";
    });
  }

  @override
  void dispose() {
    nameTextController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  TextEditingController nameTextController = TextEditingController();

  void onUpdateUserClick() {
    if (formKey.currentState?.validate() == true) {
      String name = nameTextController.text.toString().trim();

      bloc.onSetEditProfilesState(true);
      bloc.onUpdateUser(
          name, () => onUpdateSuccess(), (error) => onUpdateError(error));
    }
  }

  void onUpdateSuccess() {
    bloc.onSetEditProfilesState(false);
    showDialog(
      context: context,
      builder: (context) {
        return CommonDialog(
          title: "Success",
          description: "Your name is changed",
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
    bloc.onSetEditProfilesState(false);
    showDialog(
      context: context,
      builder: (context) {
        return CommonDialog(
          title: "Failed",
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
        child: StreamBuilder<bool?>(
            stream: bloc.isCheckingEditStream,
            builder: (context, snapshot) {
              return LoadingOverLayWidget(
                isLoading: snapshot.data ?? false,
                child: Scaffold(
                  appBar: commonAppBar(context),
                  backgroundColor: AppColors.primaryWhite,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Edit your name",
                            style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 32),
                          ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Change to new name",
                              style: Theme.of(context).textTheme.subtitle2?.copyWith(color: AppColors.primaryGray1),
                            ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32.0),
                            child: Text(
                              "Name",
                              style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 20),
                            ),
                          ),
                          CommonTextField(
                              textEditingController: nameTextController,
                              hintText: "Enter your new name",
                              textInputType: TextInputType.text,
                              validatorStyle: ValidatorStyle.text),
                          Padding(
                            padding: const EdgeInsets.only(top: 64.0),
                            child: CommonButton(
                              content: 'Update',
                              onTap: () => onUpdateUserClick(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }

  @override
  EditProfileBloc get bloc => widget.bloc;
}
