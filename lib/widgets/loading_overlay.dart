import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../resources/resources.dart';

class LoadingOverLayWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingOverLayWidget({Key? key, required this.isLoading, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        if (isLoading) ...[
          Container(
            color: AppColors.primaryBlack1.withOpacity(0.3),
          ),
          const SpinKitFadingCircle(
            color: AppColors.mediumPersianBlue,
          ),
        ]
      ],
    );
  }
}
