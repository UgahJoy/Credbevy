import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:credbevy/helpers/theme/textstyle.dart';
import 'package:flutter/material.dart';

class AmountSelector extends StatelessWidget {
  final String amount;
  final Function() onTap;
  const AmountSelector({super.key, required this.onTap, required this.amount});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(width: 0.5, color: AppColors.black),
        ),
        child: Center(
            child: Text(
          amount,
          style: body.copyWith(fontSize: 16, color: AppColors.boxBorderColor),
        )),
      ),
    );
  }
}
