import 'dart:io';

import 'package:credbevy/controllers/all_expenses.dart';
import 'package:credbevy/controllers/get_all_cards.dart';
import 'package:credbevy/helpers/constants/spacing.dart';
import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:credbevy/helpers/theme/textstyle.dart';
import 'package:credbevy/screens/send_money.dart';
import 'package:credbevy/widgets/app_button.dart';
import 'package:credbevy/widgets/app_card.dart';
import 'package:credbevy/widgets/app_scaffold.dart';
import 'package:credbevy/widgets/profile_widget.dart';
import 'package:credbevy/widgets/transaction_container_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottom: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.boxBorderColor)),
                    child: AppButton(
                      showButtonArrow: true,
                      color: AppColors.primaryColor,
                      image: "assets/analytics.png",
                      text: "Analytics",
                      onPressed: () {},
                    ),
                  ),
                ),
                const Gap(20),
                Expanded(
                  child: AppButton(
                    textColor: AppColors.primaryColor,
                    showButtonArrow: true,
                    image: "assets/send_money.png",
                    text: "Send Money",
                    onPressed: () => Get.to(() => const SendMoney()),
                  ),
                )
              ],
            ),
            const Gap(28)
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Platform.isAndroid ? const Gap(20) : const Gap(0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenPadding),
              child: ProfileWidget(
                  onTap: () {}, icon: "assets/horizontal_more.png"),
            ),
            const Gap(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenPadding),
              child: Text("My Cards", style: header),
            ),
            const Gap(12),
            GetBuilder<GetAllCardsController>(builder: (controller) {
              return SizedBox(
                height: 180,
                child: ListView.builder(
                    padding: const EdgeInsets.only(right: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.allCards.length,
                    itemBuilder: (context, index) =>
                        controller.networkCon == ConnectionState.waiting
                            ? const Center(child: CircularProgressIndicator())
                            : AppCard(
                                model: controller.allCards[index],
                              )),
              );
            }),
            const Gap(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenPadding),
              child: Row(
                children: [
                  Expanded(
                      child: Text("Transaction History",
                          style: body.copyWith(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500))),
                  Image.asset(
                    "assets/filter.png",
                    height: 28,
                    width: 28,
                  ),
                ],
              ),
            ),
            const Gap(20),
            Expanded(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(),
                height: double.infinity,
                child:
                    GetBuilder<GetAllExpensesController>(builder: (controller) {
                  return ListView.builder(
                      clipBehavior: Clip.none,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: controller.allExpenses.length,
                      itemBuilder: (context, index) =>
                          controller.networkCon == ConnectionState.none
                              ? const Center(child: CircularProgressIndicator())
                              : TransactionContainerWidgets(
                                  index: index,
                                  model: controller.allExpenses[index],
                                ));
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
