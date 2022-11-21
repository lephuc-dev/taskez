import '../resources/resources.dart';
import 'inkwell_wrapper.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final void Function() onTap;
  final String content;
  final Color? buttonColor;
  final double? borderRadius;
  final TextStyle? textStyle;
  final IconData icon;
  final Color? iconColor;

  const AppElevatedButton(
      {Key? key,
      required this.content,
      required this.onTap,
      required this.icon,
      this.buttonColor,
      this.borderRadius = 8,
      this.textStyle,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWellWrapper(
      borderRadius: BorderRadius.circular(borderRadius!),
      onTap: onTap,
      color: buttonColor ?? AppColors.primaryBlue,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Center(
            child: Row(
          children: [
            Icon(
              icon,
              color: iconColor ?? AppColors.primaryBlack1,
            ),
            SizedBox(
              width: 5,
            ),
            Text(content,
                style: textStyle ?? Theme.of(context).textTheme.button),
          ],
        )),
      ),
    );
  }
}
