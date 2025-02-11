import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:credbevy/helpers/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AppBackButton extends StatelessWidget {
  final Function? onBackPressed;
  final String? text;
  const AppBackButton({
    super.key,
    this.onBackPressed,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onBackPressed == null ? Get.back() : onBackPressed!(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios_new_outlined,
                size: 12, color: AppColors.black),
            Text(
              text ?? "",
              style: body.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black),
            ),
            const Gap(12)
          ],
        ));
  }
}
