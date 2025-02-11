import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:credbevy/helpers/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppSelector extends StatelessWidget {
  final String title;
  final String image;
  final Function() onTap;
  final int index;
  final int curentIndex;
  final double? height;
  const AppSelector(
      {super.key,
      required this.curentIndex,
      required this.image,
      required this.index,
      this.height,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: index == curentIndex
                  ? AppColors.black
                  : AppColors.captionTextColor,
            ),
            borderRadius: BorderRadius.circular(24)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              color: index == curentIndex
                  ? AppColors.black
                  : AppColors.captionTextColor,
              height: height ?? 16,
            ),
            const Gap(8),
            Text(title,
                style: body.copyWith(
                    fontSize: 16,
                    color: index == curentIndex
                        ? AppColors.black
                        : AppColors.captionTextColor))
          ],
        )),
      ),
    );
  }
}
