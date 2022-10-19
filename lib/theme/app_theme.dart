import '../resources/resources.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
      textTheme: const TextTheme(
          button: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline
          ),
          bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.primary
          ),
          bodyText2: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          )
      )
  );
}