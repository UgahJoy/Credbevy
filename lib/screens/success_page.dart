import 'dart:io';

import 'package:credbevy/helpers/constants/spacing.dart';
import 'package:credbevy/helpers/helpers.dart';
import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:credbevy/helpers/theme/textstyle.dart';
import 'package:credbevy/screens/dashboard.dart';
import 'package:credbevy/widgets/app_button.dart';
import 'package:credbevy/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SuccessPage extends StatefulWidget {
  final dynamic data;
  final String amountSent;
  final String recieverName;
  const SuccessPage(
      {super.key,
      required this.data,
      required,
      required this.recieverName,
      required this.amountSent});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottom: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              textColor: AppColors.primaryColor,
              showButtonArrow: false,
              text: "Back",
              onPressed: () => Get.off(() => const Dashboard()),
            ),
            const Gap(28)
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenPadding),
        child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Platform.isAndroid ? const Gap(20) : const Gap(0),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/check.png",
                  height: 107,
                ),
              ),
              const Gap(12),
              Text("\$${amount(widget.amountSent)}", style: header),
              const Gap(12),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Transfer successfully sent to ",
                      style: body.copyWith(
                          fontSize: 16, color: AppColors.labelTextColor),
                      children: [
                        TextSpan(
                          text: widget.recieverName,
                          style: header.copyWith(
                              fontSize: 16, color: AppColors.labelTextColor),
                        )
                      ])),
              const Gap(4),
              Text("Ref: The latest batch 99.5% pure.",
                  style: body.copyWith(color: AppColors.labelTextColor)),
              //
            ])),
      ),
    );
  }
}
