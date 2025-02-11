import 'dart:io';

import 'package:credbevy/controllers/all_beneficiaries.dart';
import 'package:credbevy/controllers/get_balance.dart';
import 'package:credbevy/helpers/constants/spacing.dart';
import 'package:credbevy/helpers/helpers.dart';
import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:credbevy/helpers/theme/textstyle.dart';
import 'package:credbevy/screens/dashboard.dart';
import 'package:credbevy/screens/success_page.dart';
import 'package:credbevy/server/server.dart';
import 'package:credbevy/widgets/amount_selector.dart';
import 'package:credbevy/widgets/app_button.dart';
import 'package:credbevy/widgets/app_scaffold.dart';
import 'package:credbevy/widgets/app_selector.dart';
import 'package:credbevy/widgets/app_textfeild.dart';
import 'package:credbevy/widgets/beneficiaries_selector.dart';
import 'package:credbevy/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  final nameController = TextEditingController();
  final refController = TextEditingController();
  final amountController = TextEditingController();
  int currentIndex = 0;
  int currentIndex2 = 0;
  List<String> images = [
    "assets/walter.png",
    "assets/marie.png",
    "assets/gustava.png"
  ];
  int beneficiaryID = 0;
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
              showButtonArrow: true,
              image: "assets/send_money.png",
              text: "Send Money",
              onPressed: () {
                sendMoney();
              },
            ),
            const Gap(28)
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenPadding),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Platform.isAndroid ? const Gap(20) : const Gap(0),
              ProfileWidget(
                onTap: () => Get.offAll(() => const Dashboard()),
                icon: "assets/home.png",
                height: 16,
              ),
              const Gap(20),
              Text("Current Balance",
                  style: body.copyWith(fontSize: 15, color: AppColors.black)),
              GetBuilder<GetBalaceController>(builder: (controller) {
                return Text("\$${amount(controller.balance)}", style: header);
              }),
              const Gap(20),
              Row(
                children: [
                  AppSelector(
                      curentIndex: currentIndex2,
                      image: "assets/favorites.png",
                      index: 0,
                      onTap: () {
                        currentIndex2 = 0;
                        setState(() {});
                      },
                      title: "Favourites"),
                  const Gap(20),
                  AppSelector(
                      height: 17,
                      curentIndex: currentIndex2,
                      image: "assets/friends.png",
                      index: 1,
                      onTap: () {
                        currentIndex2 = 1;
                        setState(() {});
                      },
                      title: "All Friends"),
                  const Spacer(),
                  Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: AppColors.black),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Image.asset(
                      "assets/plus.png",
                      height: 17,
                    )),
                  )
                ],
              ),
              const Gap(16),
              GetBuilder<GetAllBenefiaciariesController>(
                  builder: (controlller) {
                return SizedBox(
                  height: 175,
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                    scrollDirection: Axis.horizontal,
                    itemCount: controlller.allBeneficiariesModel.length,
                    itemBuilder: (context, index) =>
                        Builder(builder: (context) {
                      return controlller.networkCon == ConnectionState.none
                          ? const Center(child: CircularProgressIndicator())
                          : BeneficiariesSelector(
                              name: controlller
                                      .allBeneficiariesModel[index].fullname ??
                                  "",
                              image: images[index],
                              index: index,
                              currentIndex: currentIndex,
                              onTap: () {
                                currentIndex = index;
                                beneficiaryID = controlller
                                        .allBeneficiariesModel[index].id ??
                                    0;
                                nameController.text = controlller
                                        .allBeneficiariesModel[index]
                                        .fullname ??
                                    "";

                                setState(() {});
                              });
                    }),
                  ),
                );
              }),
              const Gap(20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppTextField(
                          labelText: "Name",
                          controller: nameController,
                          hintText: "Walter White"),
                      const Gap(20),
                      AppTextField(
                          keyboardType: TextInputType.number,
                          labelText: "Amount \$",
                          controller: amountController,
                          hintText: "How much do you want to send?"),
                      const Gap(8),
                      Row(children: [
                        AmountSelector(
                          onTap: () {
                            amountController.text = "10";
                            setState(() {});
                          },
                          amount: "+10",
                        ),
                        AmountSelector(
                          onTap: () {
                            amountController.text = "100";
                            setState(() {});
                          },
                          amount: "+100",
                        ),
                        AmountSelector(
                          onTap: () {
                            double updatedBalance =
                                Get.find<GetBalaceController>().balance - 10;
                            amountController.text = updatedBalance.toString();
                            setState(() {});
                          },
                          amount: "-10",
                        ),
                        AmountSelector(
                          onTap: () {
                            double updatedBalance =
                                Get.find<GetBalaceController>().balance - 100;
                            amountController.text = updatedBalance.toString();
                            setState(() {});
                          },
                          amount: "-100",
                        ),
                      ]),
                      const Gap(20),
                      AppTextField(
                          labelText: "Refrence",
                          controller: refController,
                          hintText: "What is this transfer for?"),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendMoney() async {
    if ((double.tryParse(amountController.text) ?? 0.0) >
        Get.find<GetBalaceController>().balance) {
      showAppSnackbar("Insuficient funds...");
      return;
    }
    if (nameController.text.isEmpty) {
      showAppSnackbar("Please enter the name of the receiver...");
      return;
    }
    if (amountController.text.isEmpty) {
      showAppSnackbar("Please enter amount...");
      return;
    }
    if (refController.text.isEmpty) {
      showAppSnackbar("Refrence can not be empty...");
      return;
    }
    var response = await Server(showProgressBar: true, key: "transfer")
        .postRequest(
            {"receiver_id": beneficiaryID, "amount": amountController.text});
    if (processResponse(response,
        showErrorMessage: true, showSuccessMessage: true)) {
      Get.offAll(() => SuccessPage(
            recieverName: nameController.text,
            amountSent: amountController.text,
            data: response["message"],
          ));
    }
  }
}
