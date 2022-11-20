import 'package:flutter/material.dart';
import 'package:taskez/base/base.dart';
import 'package:taskez/blocs/change_password/change_password.dart';
import 'package:taskez/enums/enums.dart';
import 'package:taskez/resources/resources.dart';
import 'package:taskez/widgets/widgets.dart';

class ChangePasswordPage extends StatefulWidget {
  final ChangePasswordBloc bloc;

  const ChangePasswordPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordState();
}

class _ChangePasswordState
    extends BaseState<ChangePasswordPage, ChangePasswordBloc> {
  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  bool check = false;
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController newPasswordTextController = TextEditingController();
  TextEditingController rePasswordTextController = TextEditingController();

  void onUpdatePasswordClick() {
    if (formKey.currentState?.validate() == true) {
      String password = passwordTextController.text.toString().trim();
      String newPassword = newPasswordTextController.text.toString().trim();
      String confirmPassword = rePasswordTextController.text.toString().trim();

      bloc.onCheckPassword(
          password, () => onCheckSucces(), (error) => onCheckFail(error));

      if (!check) {
        return;
      }

      if (newPassword != confirmPassword) {
        onPasswordNotConfirmed();
        return;
      }

      bloc.onUpdatePassword(newPassword, () => onUpdateSuccess(),
          (error) => onUpdateError(error));
    }
  }

  void onPasswordNotConfirmed() {
    showDialog(
      context: context,
      builder: (context) {
        return CommonDialog(
          title: "Confirm Password Failed",
          description: "The password confirms does not match",
          contentButton: "Close",
          onTap: () => Navigator.pop(context),
        );
      },
    );
  }

  void onUpdateSuccess() {
    showDialog(
      context: context,
      builder: (context) {
        return CommonDialog(
          title: "Update passowrd Success",
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
          title: "Update Password Failed",
          description: error,
          contentButton: "Close",
          onTap: () => Navigator.pop(context),
        );
      },
    );
  }

  onCheckSucces() {
    check = true;
  }

  onCheckFail(String error) {
    check = false;
    showDialog(
      context: context,
      builder: (context) {
        return CommonDialog(
          title: "Password Not True",
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
                    "Password",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontSize: 20),
                  ),
                ),
                CommonTextField(
                  textEditingController: passwordTextController,
                  hintText: "Enter your password",
                  textInputType: TextInputType.text,
                  validatorStyle: ValidatorStyle.password,
                  isPasswordTextField: true,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: Text(
                    "New Password",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontSize: 20),
                  ),
                ),
                CommonTextField(
                  textEditingController: newPasswordTextController,
                  hintText: "Cofirm new password",
                  textInputType: TextInputType.text,
                  validatorStyle: ValidatorStyle.password,
                  isPasswordTextField: true,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: Text(
                    "Re Enter Password",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontSize: 20),
                  ),
                ),
                CommonTextField(
                  textEditingController: rePasswordTextController,
                  hintText: "Re enter your password",
                  textInputType: TextInputType.text,
                  validatorStyle: ValidatorStyle.password,
                  isPasswordTextField: true,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 64.0),
                  child: CommonButton(
                    content: 'Save',
                    onTap: () => onUpdatePasswordClick(),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  ChangePasswordBloc get bloc => widget.bloc;
}
