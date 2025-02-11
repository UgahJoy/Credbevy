import 'package:credbevy/controllers/all_beneficiaries.dart';
import 'package:credbevy/controllers/all_expenses.dart';
import 'package:credbevy/controllers/get_all_cards.dart';
import 'package:credbevy/controllers/get_balance.dart';
import 'package:credbevy/helpers/global_variables/global_variables.dart';
import 'package:credbevy/helpers/theme/app_theme.dart';
import 'package:credbevy/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State createState() => _MyApp();
}

class _MyApp extends State {
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: appTheme,
      initialRoute: "/dashboard",
      getPages: [GetPage(name: "/dashboard", page: () => const Dashboard())],
    );
  }

  void init() {
    Get.put(GetAllCardsController(), permanent: true);
    Get.put(GetAllExpensesController(), permanent: true);
    Get.put(GetAllBenefiaciariesController(), permanent: true);
    Get.put(GetBalaceController(), permanent: true);
  }
}
