import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';
import '../../resources/resources.dart';
import '../../router/router.dart';

class SplashPage extends StatefulWidget {
  final SplashBloc bloc;

  const SplashPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage, SplashBloc> {
  int? isBoardViewed;
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    goToNextPage();
  }

  void goToNextPage() async {
    if (await bloc.getBoardViewed()) {
      Future.delayed(const Duration(seconds: 1)).then(
            (value) => Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.signIn,
              (route) => false,
        ),
      );
    }
    else {
      Future.delayed(const Duration(seconds: 1)).then(
            (value) => Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.onBoarding,
              (route) => false,
        ),
      );
    }
  }

  Future<bool> onWillPop() async => false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: AppColors.mediumPersianBlue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                VectorImageAssets.icon_logo,
                height: 120,
                width: 120,
                color: AppColors.primaryWhite,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  'taskez',
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: 48,
                        color: AppColors.primaryWhite,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SplashBloc get bloc => widget.bloc;
}
