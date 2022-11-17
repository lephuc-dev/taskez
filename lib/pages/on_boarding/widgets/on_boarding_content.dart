import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../resources/resources.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({Key? key, required this.title, required this.description, required this.image}) : super(key: key);

  final String title, description, image;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            image,
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primaryWhite.withOpacity(1),
                AppColors.primaryWhite.withOpacity(0.95),
                AppColors.primaryWhite.withOpacity(0.85),
                AppColors.primaryWhite.withOpacity(0.75),
                AppColors.primaryWhite.withOpacity(0.5),
                AppColors.primaryWhite.withOpacity(0.25),
                AppColors.primaryWhite.withOpacity(0.05),
                AppColors.primaryWhite.withOpacity(0.005),
              ],
            ))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 28)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(description, style: Theme.of(context).textTheme.subtitle2?.copyWith(color: AppColors.primaryBlack2)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
