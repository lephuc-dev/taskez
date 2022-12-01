import 'package:flutter/material.dart';
import '../../../resources/resources.dart';

class TaskItem extends StatelessWidget {
  final Color color;
  final String name;
  final int amount;

  const TaskItem({
    Key? key,
    required this.color,
    required this.name,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.headline5?.copyWith(color: AppColors.primaryWhite, fontSize: 14),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Tasks: ${amount.toString()}",
              style: Theme.of(context).textTheme.headline5?.copyWith(color: AppColors.primaryWhite),
            ),
          )
        ],
      ),
    );
  }
}
