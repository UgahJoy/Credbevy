import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:credbevy/helpers/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BeneficiariesSelector extends StatelessWidget {
  final String name;
  final Function() onTap;
  final int index;
  final int currentIndex;
  final String image;
  const BeneficiariesSelector(
      {super.key,
      required this.index,
      required this.image,
      required this.currentIndex,
      required this.name,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        decoration: BoxDecoration(
            color: index == currentIndex
                ? AppColors.buttonColor
                : AppColors.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  blurRadius: 6,
                  color: AppColors.captionTextColor.withOpacity(0.2))
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  image,
                  height: 64,
                )),
            const Gap(8),
            Text(name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: body.copyWith(
                    fontSize: 16,
                    color: index == currentIndex
                        ? AppColors.primaryColor
                        : AppColors.black)),
            const Gap(12),
            Image.asset(
              "assets/favorites.png",
              color: index == currentIndex
                  ? AppColors.primaryColor
                  : AppColors.black,
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
