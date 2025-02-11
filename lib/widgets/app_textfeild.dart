import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:credbevy/helpers/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final bool readonly;
  final String? labelText;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final bool require;
  final double? width;
  final Widget? suffixIcon;
  final Widget? preixIcon;
  final double? labelTextSize;
  final Color? labelTextColor;
  final Color? filledColor;
  final FontWeight? width1;
  final Function(String)? onChange;
  final bool obscureText;
  final Color borderColor;
  final double? borderRadius;
  final double? hintTextHeight;
  const AppTextField(
      {required this.controller,
      required this.hintText,
      this.labelText,
      this.onTap,
      this.filledColor,
      this.preixIcon,
      this.hintTextHeight,
      this.width,
      this.borderRadius,
      this.borderColor = AppColors.textFieldColor,
      this.onChange,
      this.width1,
      this.obscureText = false,
      this.suffixIcon,
      this.isPassword = false,
      this.labelTextSize = 12,
      this.labelTextColor,
      this.readonly = false,
      this.require = true,
      this.keyboardType,
      super.key});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (widget.labelText != null) ...[
              Expanded(
                child: Text(widget.labelText!,
                    style: labelText.copyWith(
                        color: widget.labelTextColor,
                        fontSize: widget.labelTextSize,
                        fontWeight: widget.width1)),
              ),
            ],
          ],
        ),
        const Gap(8),
        TextFormField(
          style: const TextStyle(overflow: TextOverflow.ellipsis),
          readOnly: widget.readonly,
          onChanged: widget.onChange,
          obscureText: widget.obscureText && !isVisible,
          onTap: widget.onTap,
          cursorColor: AppColors.black,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          decoration: InputDecoration(
            hintStyle: TextStyle(
                color: AppColors.hintTextColor,
                fontSize: widget.hintTextHeight ?? 12),
            fillColor: widget.filledColor ?? Colors.transparent,
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      if (isVisible) {
                        isVisible = false;
                        setState(() {});
                        return;
                      }

                      isVisible = true;
                      setState(() {});
                      return;
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                            isVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.black,
                            size: 16)))
                : widget.suffixIcon,
            prefixIcon: widget.preixIcon,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                borderSide: BorderSide(
                    color: widget.borderColor, width: widget.width ?? 1.5)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                borderSide: BorderSide(
                    color: widget.borderColor, width: widget.width ?? 1.5)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                borderSide: BorderSide(
                    color: widget.borderColor, width: widget.width ?? 1.5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                borderSide: const BorderSide(
                    color: AppColors.boxBorderColor, width: 1.5)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                borderSide: BorderSide(
                    color: widget.borderColor, width: widget.width ?? 1.5)),
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }
}
