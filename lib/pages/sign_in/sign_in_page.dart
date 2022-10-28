import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import '../../widgets/common_button.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';

class SignInPage extends StatefulWidget {
  final SignInBloc bloc;
  const SignInPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends BaseState<SignInPage, SignInBloc> {

  @override
  SignInBloc get bloc => widget.bloc;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your email"
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Text(
                      "Password",
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 20, color: AppColors.primaryBlack2),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter your password"
                    ),
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
                      onTap: (){},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
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
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
