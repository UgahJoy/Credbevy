// ignore_for_file: must_be_immutable

import 'package:credbevy/helpers/helpers.dart';
import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:credbevy/helpers/theme/textstyle.dart';
import 'package:credbevy/models/all_expanses.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TransactionContainerWidgets extends StatelessWidget {
  final AllExpensesModel model;
  final int index;
  TransactionContainerWidgets(
      {super.key, required this.model, required this.index});
  List<String> images = [
    "assets/netflix.png",
    "assets/uber_icon.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 30),
                spreadRadius: 0,
                blurRadius: 30,
                color: AppColors.captionTextColor.withOpacity(0.1))
          ]),
      child: Row(
        children: [
          Image.asset(index % 2 == 0 ? images[0] : images[1], height: 38),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.month ?? "",
                  style:
                      body.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                const Gap(6),
                Text(
                  "${getMonthShortName(model.month ?? "")} 10  -  2:00pm",
                  style: body.copyWith(
                      color: AppColors.captionTextColor.withOpacity(0.8),
                      fontSize: 12),
                )
              ],
            ),
          ),
          Text(
            "-\$${amount(model.amountSpent)}",
            style: header.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
