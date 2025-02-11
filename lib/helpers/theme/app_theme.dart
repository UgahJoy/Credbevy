// ignore_for_file: deprecated_member_use

import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  fontFamily: "inter",
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.primaryColor,
  primarySwatch: const MaterialColor(0xff009BEF, <int, Color>{
    50: AppColors.primaryColor,
    100: AppColors.primaryColor,
    200: AppColors.primaryColor,
    300: AppColors.primaryColor,
    400: AppColors.primaryColor,
    500: AppColors.primaryColor,
    600: AppColors.primaryColor,
    700: AppColors.primaryColor,
    800: AppColors.primaryColor,
    900: AppColors.primaryColor
  }),
  brightness: Brightness.light,
  useMaterial3: false,
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
  ),
  textTheme: const TextTheme(
      bodyMedium: TextStyle(
          color: AppColors.grey, fontSize: 16, fontWeight: FontWeight.w400)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all(const TextStyle(
              color: AppColors.boxBorderColor,
              fontSize: 16,
              fontWeight: FontWeight.w600)),
          backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 30, vertical: 8)))),
);
