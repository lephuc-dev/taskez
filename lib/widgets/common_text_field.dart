import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? hintText;
  final bool? isPasswordTextField;

  const CommonTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.isPasswordTextField = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: isPasswordTextField!,
      decoration: InputDecoration(
        hintText: hintText
      ),
    );
  }
}
