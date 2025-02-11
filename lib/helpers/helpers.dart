// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:credbevy/helpers/global_variables/global_variables.dart';
import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void showAppSnackbar(String message,
    {Color? textColor,
    String title = "Message",
    Duration? duration,
    final bool error = false}) {
  Get.snackbar(
      duration: duration ?? const Duration(seconds: 2),
      backgroundColor: const Color(0xFF101618).withOpacity(0.4),
      colorText: textColor ?? AppColors.primaryColor,
      title,
      message);
}

Future<dynamic> showApplDialog(Widget child) async {
  return await showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    context: navigatorKey.currentContext!,
    builder: (context) => child,
  );
}

void logger(dynamic value) {
  log(value.toString());
}

Future<T?> showApplBottomSheet<T>(Widget child) {
  return Get.bottomSheet(child,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )));
}

String extractedID(inputString) {
  return inputString;
}

bool serverProcessor(var response) {
  if (response == "failed") {
    return false;
  } else if (response["status"] == 404 || response["status"] == 400) {
    showAppSnackbar(response["statusMessage"]);
    return false;
  } else {
    showAppSnackbar(response["statusMessage"]);
  }
  return true;
}

String amount(dynamic value, {String? formateForm}) {
  double amount = double.tryParse(value.toString()) ?? 0.0;
  var format = NumberFormat(formateForm ?? '#,##0', 'en_US');

  String formattedAmount;
  if (amount != 0) {
    formattedAmount = format.format(amount);
  } else {
    formattedAmount = '0';
  }

  return formattedAmount;
}

bool processResponse(dynamic response,
    {bool showSuccessMessage = false, bool showErrorMessage = false}) {
  try {
    if (response.toString() != "failed" && response['error'] == false) {
      if (showSuccessMessage) {
        showAppSnackbar(response['message']);
      }
      return true;
    }
    if (showErrorMessage) {
      showAppSnackbar(response['message'], error: true, title: "Error");
    }
    return false;
  } catch (ex) {
    if (showErrorMessage) {
      showAppSnackbar(response.toString());
    }
    return false;
  }
}

String getMonthShortName(String value) {
  if (value == "January") {
    return "Jan";
  }
  if (value == "February") {
    return "Feb";
  }
  if (value == "March") {
    return "Mar";
  }
  if (value == "April") {
    return "Apr";
  }
  if (value == "May") {
    return "May";
  }
  if (value == "June") {
    return "Jun";
  }
  if (value == "July") {
    return "Jul";
  }
  if (value == "August") {
    return "Aug";
  }
  if (value == "September") {
    return "Sep";
  }
  if (value == "October") {
    return "Oct";
  }
  if (value == "November") {
    return "Nov";
  }
  if (value == "December") {
    return "Dec";
  }
  return "";
}
