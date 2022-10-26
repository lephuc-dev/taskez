import '../resources/resources.dart';
import 'inkwell_wrapper.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final void Function() onTap;
  final String content;
  final Color? buttonColor;
  final double? borderRadius;
  final TextStyle? textStyle;

  const CommonButton(
      {Key? key, required this.content, required this.onTap, this.buttonColor = AppColors.primaryRed, this.borderRadius = 8, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWellWrapper(
      borderRadius: BorderRadius.circular(borderRadius!),
      onTap: onTap,
      color: buttonColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Center(child: Text(content, style: textStyle ?? Theme.of(context).textTheme.button)),
      ),
    );
  }
}
