import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class OnBoardingNavButton extends StatelessWidget {
  const OnBoardingNavButton({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWellWrapper(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          name,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
