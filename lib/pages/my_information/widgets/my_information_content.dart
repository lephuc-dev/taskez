import 'package:flutter/material.dart';

import '../../../../resources/resources.dart';

class MyInformationContet extends StatelessWidget {
  const MyInformationContet({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontSize: 24, color: AppColors.primaryBlack3),
          ),
        ),
      ],
    );
  }
}
