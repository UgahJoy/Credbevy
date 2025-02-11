// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:credbevy/helpers/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppButton extends StatefulWidget {
  final String text;
  final String? image;
  final Function() onPressed;
  double borderRaduis;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final bool disabled;
  final double? textHeight;
  final double? border;
  final FontWeight? textWeight;
  final bool showButtonArrow;

  AppButton(
      {this.borderRaduis = 16,
      required this.text,
      this.color,
      this.textColor,
      this.image,
      this.textHeight,
      this.textWeight,
      this.borderColor,
      this.showButtonArrow = false,
      this.border,
      this.disabled = false,
      required this.onPressed,
      super.key});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 52,
      width: size.width,
      child: ElevatedButton(
          onPressed: () {
            if (widget.disabled) {
              return;
            }
            widget.onPressed();
          },
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              foregroundColor: MaterialStateProperty.all(Colors.transparent),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              padding: MaterialStateProperty.all(const EdgeInsets.all(.0)),
              backgroundColor: MaterialStateProperty.all(
                  widget.color ?? AppColors.buttonColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.borderRaduis)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.showButtonArrow == true) ...[
                Image.asset(
                  widget.image!,
                  height: 20,
                ),
                const Gap(8)
              ],
              Text(widget.text,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: header.copyWith(
                      fontWeight: widget.textWeight,
                      color: widget.textColor ?? AppColors.black,
                      fontSize: widget.textHeight ?? 16)),
            ],
          )),
    );
  }
}
