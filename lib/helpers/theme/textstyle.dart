import 'package:credbevy/helpers/global_variables/global_variables.dart';
import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RevBill {
  const RevBill._();

  static TextStyle header({
    double fontSize = 26,
    FontWeight fontWeight = FontWeight.w700,
    double? letterSpacing,
    Color color = AppColors.black,
    FontStyle? fontStyle,
    TextStyle? textStyle,
    double? wordSpacing,
    TextDecoration? decoration,
    double? height,
  }) =>
      Theme.of(navigatorKey.currentState!.context)
          .textTheme
          .titleMedium!
          .copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
              fontStyle: fontStyle,
              decoration: decoration,
              wordSpacing: wordSpacing,
              letterSpacing: letterSpacing,
              height: height);

  static TextStyle body({
    double fontSize = 14,
    double? letterSpacing,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.boxBorderColor,
    FontStyle? fontStyle,
    TextStyle? textStyle,
    double? wordSpacing,
    TextDecoration? decoration,
    double? height,
  }) =>
      Theme.of(navigatorKey.currentState!.context)
          .textTheme
          .bodyMedium!
          .copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
              fontStyle: fontStyle,
              decoration: decoration,
              wordSpacing: wordSpacing,
              letterSpacing: letterSpacing,
              height: height);
}

TextStyle header = RevBill.header();
TextStyle body = RevBill.body();
TextStyle labelText = RevBill.body().copyWith(
    fontSize: 15, color: AppColors.labelTextColor, fontWeight: FontWeight.w400);
TextStyle buttonText = RevBill.body().copyWith(
    fontSize: 16, color: AppColors.boxBorderColor, fontWeight: FontWeight.w700);
