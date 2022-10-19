import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String? titleKeyStr;

  const LoadingWidget({this.titleKeyStr});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CircularProgressIndicator(),
        ),
        if (titleKeyStr?.isNotEmpty == true) ...[
          const SizedBox(),
          Center(
            child: Text(
              titleKeyStr ?? '',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ]
      ],
    );
  }
}
