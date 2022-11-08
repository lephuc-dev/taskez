import 'package:flutter/material.dart';
import '../enums/enums.dart';
import '../resources/resources.dart';
import '../validator/validator.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;
  final ValidatorStyle validatorStyle;
  final bool? isPasswordTextField;

  const CommonTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.textInputType,
    required this.validatorStyle,
    this.isPasswordTextField = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: isPasswordTextField!,
      keyboardType: textInputType,
      cursorColor: AppColors.primaryBlack1,
      decoration: getTextFieldDecoration(context),
      validator: (val) => getValidator(val),
    );
  }

  String? getValidator(String? val) {
    switch (validatorStyle) {
      case ValidatorStyle.text:
        return Validator().text(val);
      case ValidatorStyle.email:
        return Validator().email(val);
      case ValidatorStyle.password:
        return Validator().password(val);
      default:
        return null;
    }
  }

  InputDecoration getTextFieldDecoration(BuildContext context) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.subtitle2?.copyWith(color: AppColors.primaryGray1),
      errorStyle: Theme.of(context).textTheme.subtitle2?.copyWith(color: AppColors.primaryError, fontSize: 14),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryGray1),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryBlack1, width: 1.5),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryError),
      ),
    );
  }
}
