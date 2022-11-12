import 'package:flutter/material.dart';
import '../resources/resources.dart';

class AppThemes {
  static AppThemes? _instance;

  AppThemes._();

  factory AppThemes() {
    _instance ??= AppThemes._();
    return _instance!;
  }

  ThemeData get lightTheme => _lightTheme;

  static const TextTheme _lightTextTheme = TextTheme(
    headline1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColors.primaryWhite),
    headline2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w900, color: AppColors.primaryWhite),
    headline3: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800, color: AppColors.primaryWhite),
    headline4: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: AppColors.primaryWhite),
    headline5: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColors.primaryWhite),
    headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: AppColors.primaryWhite),
    subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: AppColors.primaryWhite),
    subtitle2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: AppColors.primaryWhite),
    bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: AppColors.primaryWhite),
    bodyText2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: AppColors.primaryWhite),
    caption: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: AppColors.primaryWhite),
    button: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: AppColors.primaryBlack1),
    overline: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: AppColors.primaryWhite),
  );

  final _lightTheme = ThemeData(
    fontFamily: 'AvenirNextRoundedPro',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: _lightTextTheme,
  );
}
