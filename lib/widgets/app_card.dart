import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:credbevy/helpers/theme/textstyle.dart';
import 'package:credbevy/models/all_card.model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppCard extends StatelessWidget {
  final AllCardsModel model;

  final LinearGradient? color;
  const AppCard({super.key, this.color, required this.model});
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(left: 16),
      width: 288,
      decoration: BoxDecoration(
          gradient: model.id == 1
              ? const LinearGradient(
                  stops: [0.01, 0.8],
                  begin: AlignmentDirectional.bottomStart,
                  end: Alignment.topRight,
                  colors: [Color(0xffFFC3E0), Color(0xffFF78ED)])
              : const LinearGradient(
                  stops: [0.7, 0.9],
                  begin: AlignmentDirectional.bottomStart,
                  end: Alignment.topRight,
                  colors: [Color(0xff5FAFD3), Color(0xffD3E8E1)]),
          borderRadius: BorderRadius.circular(23)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: model.id == 1
                ? const Color(0xffFBAEEE).withOpacity(0.37)
                : const Color(0xff5FAFD3).withOpacity(0.37)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(model.bankName ?? "",
                        style: body.copyWith(color: AppColors.primaryColor))),
                Image.asset(
                  model.cardType == "MasterCard"
                      ? "assets/card_icon.png"
                      : "assets/visa_logo.png",
                  height: 28,
                )
              ],
            ),
            const Spacer(),
            Text(model.cardNumber ?? "",
                style:
                    body.copyWith(color: AppColors.primaryColor, fontSize: 20)),
            const Spacer(),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("NAME",
                        style: body.copyWith(
                            color: AppColors.primaryColor, fontSize: 10)),
                    const Gap(4),
                    Text(model.name ?? "",
                        style: body.copyWith(color: AppColors.primaryColor)),
                  ],
                )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("EXPIRY",
                        style: body.copyWith(
                            color: AppColors.primaryColor, fontSize: 10)),
                    const Gap(4),
                    Text(model.expiryDate ?? "",
                        style: body.copyWith(color: AppColors.primaryColor)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
