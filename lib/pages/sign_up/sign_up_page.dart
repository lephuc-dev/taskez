import 'package:flutter/material.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';
import '../../enums/enums.dart';
import '../../resources/resources.dart';
import '../../widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  final SignUpBloc bloc;

  const SignUpPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends BaseState<SignUpPage, SignUpBloc> {
  @override
  SignUpBloc get bloc => widget.bloc;

  TextEditingController emailTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    bloc.onSetRegisteringState(false);
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    nameTextController.dispose();
    super.dispose();
  }

  void onSignUpClick() {
    if (formKey.currentState?.validate() == true) {
      String name = nameTextController.text.toString().trim();
      String email = emailTextController.text.toString().trim();
      String password = passwordTextController.text.toString().trim();
      String confirmPassword = confirmPasswordTextController.text.toString().trim();

      if (password != confirmPassword) {
        onPasswordNotConfirmed();
        return;
      }

      bloc.onSetRegisteringState(true);

      bloc.onSignUp(name, email, password, () => onRegisterSuccess(), (error) => onRegisterError(error));
    }
  }

  void onPasswordNotConfirmed() {
    showDialog(
      context: context,
      builder: (context) {
        return CommonDialog(
          title: "Register Failed",
          description: "The password confirms does not match",
          contentButton: "Close",
          onTap: () => Navigator.pop(context),
        );
      },
    );
  }

  void onRegisterSuccess() {
    bloc.onSetRegisteringState(false);
    showDialog(
      context: context,
      builder: (context) {
        return CommonDialog(
          title: "Register Success",
          description: "Please login to continue using",
          contentButton: "Close",
          onTap: () => {
            Navigator.pop(context),
            Navigator.pop(context),
          },
        );
      },
    );
  }

  void onRegisterError(String error) {
    bloc.onSetRegisteringState(false);
    showDialog(
      context: context,
      builder: (context) {
        return CommonDialog(
          title: "Register Failed",
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
          stream: bloc.isCheckingSignUpStream,
          builder: (context, snapshot) {
            return LoadingOverLayWidget(
              isLoading: snapshot.data ?? false,
              child: Scaffold(
                backgroundColor: AppColors.backgroundDarkMode,
                appBar: commonAppBar(context),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sign up",
                              style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 32),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Register your account",
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
                              hintText: "Enter your name",
                              textInputType: TextInputType.text,
                              validatorStyle: ValidatorStyle.text,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 32.0),
                              child: Text(
                                "Email",
                                style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 20),
                              ),
                            ),
                            CommonTextField(
                              textEditingController: emailTextController,
                              hintText: "Enter your email",
                              textInputType: TextInputType.emailAddress,
                              validatorStyle: ValidatorStyle.email,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 32.0),
                              child: Text(
                                "Password",
                                style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 20),
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
                              padding: const EdgeInsets.only(top: 32.0),
                              child: Text(
                                "Confirm password",
                                style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 20),
                              ),
                            ),
                            CommonTextField(
                              textEditingController: confirmPasswordTextController,
                              hintText: "Enter your password again",
                              textInputType: TextInputType.text,
                              validatorStyle: ValidatorStyle.password,
                              isPasswordTextField: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 64.0),
                              child: CommonButton(
                                content: 'Sign Up',
                                onTap: () => onSignUpClick(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
