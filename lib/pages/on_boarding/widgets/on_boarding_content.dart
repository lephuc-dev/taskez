import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../resources/resources.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({Key? key, required this.title, required this.description, required this.image}) : super(key: key);

  final String title, description, image;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          image,
          height: size.height * 0.25,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 24, color: AppColors.primaryBlack3),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            description,
            style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 18, color: AppColors.primaryBlack3.withOpacity(0.8)),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
