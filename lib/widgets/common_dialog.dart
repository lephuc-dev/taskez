import '../resources/resources.dart';
import 'common_button.dart';
import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {
  final String title;
  final String description;
  final String contentButton;
  final void Function() onTap;

  const CommonDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.contentButton,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.primaryWhite,
      contentPadding: const EdgeInsets.all(16),
      content: contentDialog(context),
    );
  }

  Widget contentDialog(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 20)),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(color: AppColors.primaryGray1),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: CommonButton(content: contentButton, onTap: onTap),
        )
      ],
    );
  }
}
