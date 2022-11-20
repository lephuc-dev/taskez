import 'package:flutter/material.dart';

import '../../../../resources/resources.dart';

class Statistic extends StatelessWidget {
  const Statistic({Key? key, required this.name, required this.progress})
      : super(key: key);
  final String name;
  final String progress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(color: AppColors.primaryGrey, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryRed, width: 2),
                ),
                constraints: const BoxConstraints(
                  maxWidth: 80,
                  maxHeight: 80,
                ),
                child: Text(
                  progress,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color: AppColors.primaryBlack1, fontSize: 16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: AppColors.primaryBlack1, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
