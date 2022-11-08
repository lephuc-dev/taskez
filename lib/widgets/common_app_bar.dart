import 'package:flutter/material.dart';
import '../resources/resources.dart';

PreferredSizeWidget commonAppBar(BuildContext context, {String? title, bool centerTitle = false}) {
  return AppBar(
    backgroundColor: AppColors.primaryWhite,
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColors.primaryBlack1),
    title: title == null
        ? null
        : Text(
            title,
            style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 20),
          ),
    centerTitle: centerTitle,
  );
}
