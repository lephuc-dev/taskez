import '../resources/resources.dart';
import 'inkwell_wrapper.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final void Function() onTap;
  final String content;
  final Color? buttonColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  const CommonButton({
    Key? key,
    required this.content,
    required this.onTap,
    this.buttonColor,
    this.borderRadius,
    this.padding,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWellWrapper(
      borderRadius: borderRadius ?? BorderRadius.circular(4),
      onTap: onTap,
      color: buttonColor ?? AppColors.primaryBlack1,
      child: Container(
        padding: padding ?? const EdgeInsets.all(16),
        child: Center(child: Text(content, style: textStyle ?? Theme.of(context).textTheme.button)),
      ),
    );
  }
}
