import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../resources/resources.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  final String title, description, image;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            fit: BoxFit.contain,
            height: 220,
            width: 220,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 28),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              description,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: AppColors.primaryBlack2,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
