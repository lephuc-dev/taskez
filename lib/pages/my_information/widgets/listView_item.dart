import 'package:flutter/material.dart';

import '../../../../resources/resources.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 2.0),
      child: Container(
        width: 160.0,
        decoration: BoxDecoration(
            color: AppColors.primaryRed,
            borderRadius: BorderRadius.circular(5.0)),
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 24.0, bottom: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 3.0),
                child: Text(
                  'Events',
                  style: TextStyle(color: AppColors.primaryWhite, fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  '12 Tasks',
                  style: TextStyle(
                      color: AppColors.primaryWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
