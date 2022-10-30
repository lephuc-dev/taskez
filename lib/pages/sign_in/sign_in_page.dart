import 'package:flutter/material.dart';
import '../../router/router.dart';
import '../../enums/enums.dart';
import '../../resources/resources.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  final SignInBloc bloc;

  const SignInPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends BaseState<SignInPage, SignInBloc> {
  @override
  SignInBloc get bloc => widget.bloc;

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    bloc.onSetCheckingSignInState(false);
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  void onLogInClick() {
    if (formKey.currentState?.validate() == true) {
      String email = emailTextController.text.toString().trim();
      String password = passwordTextController.text.toString().trim();
      bloc.onSetCheckingSignInState(true);
      bloc.onSignIn(email, password, () => onLogInSuccess(), (error) => onLogInError(error));
    }
  }

  void onLogInSuccess() {
    bloc.onSetCheckingSignInState(false);
    Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
  }

  void onLogInError(String error) {
    bloc.onSetCheckingSignInState(false);
    showDialog(
      context: context,
      builder: (context) {
        return CommonDialog(
          title: "Login Failed",
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
          stream: bloc.isCheckingSignInStream,
          builder: (context, snapshot) {
            return LoadingOverLayWidget(
              isLoading: snapshot.data ?? false,
              child: Scaffold(
                backgroundColor: AppColors.primaryWhite,
                appBar: AppBar(
                  backgroundColor: AppColors.primaryWhite,
                  elevation: 0,
                ),
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
                              "Welcome back",
                              style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 32, color: AppColors.primaryBlack2),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Sign in to continue",
                                style: Theme.of(context).textTheme.subtitle2?.copyWith(color: AppColors.primaryGray1),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 32.0),
                              child: Text(
                                "Email",
                                style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 20, color: AppColors.primaryBlack2),
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
                                style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 20, color: AppColors.primaryBlack2),
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
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Forgot password",
                                  style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 18, color: AppColors.primaryBlack2),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 64.0),
                              child: CommonButton(
                                content: 'Log In',
                                onTap: () => onLogInClick(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: InkWellWrapper(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () => Navigator.pushNamed(context, Routes.signUp),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Already have an account?",
                                        style: Theme.of(context).textTheme.subtitle2?.copyWith(color: AppColors.primaryGray1),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "Sign Up",
                                        style: Theme.of(context).textTheme.headline3?.copyWith(color: AppColors.primaryRed),
                                      ),
                                    ],
                                  ),
                                ),
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
