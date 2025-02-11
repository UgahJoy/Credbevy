// ignore_for_file: deprecated_member_use

import "package:credbevy/helpers/theme/app_colors.dart";
import "package:flutter/material.dart";

void showProgressContainer(BuildContext context,
    {String message = "Please Wait..."}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => RevbillIndicator(message: message));
}

class RevbillIndicator extends StatelessWidget {
  final String message;

  const RevbillIndicator({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: AppColors.grey,
          child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 12),
              child: Wrap(
                  runAlignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 10),
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(AppColors.buttonColor),
                    ),
                    const SizedBox(width: 15),
                    Text(message,
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                        )),
                  ])),
        ));
  }
}
