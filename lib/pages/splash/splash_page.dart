import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
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
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.onBoarding,
        (route) => false,
      ),
    );
  }

  Future<bool> onWillPop() async => false;

  final double imageSize = 20;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: AppColors.primaryWhite,
        body: Stack(
          children: [
            const Image(
              width: double.infinity,
              height: double.infinity,
              image: AssetImage(ImageAssets.img_splash),
              fit: BoxFit.cover,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryBlack1.withOpacity(0.5),
                    AppColors.primaryBlack1.withOpacity(0.3),
                    AppColors.primaryBlack1.withOpacity(0.005),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 64.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'A MAGIC WAY TO MANAGE YOUR TASKS',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 32,
                          height: 1.4,
                          color: AppColors.primaryWhite,
                        ),
                    textAlign: TextAlign.start,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(VectorImageAssets.icon_logo, height: imageSize, width: imageSize),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'taskez',
                            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                  fontSize: 24,
                                  color: AppColors.primaryWhite,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SplashBloc get bloc => widget.bloc;
}
