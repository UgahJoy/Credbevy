import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  final String icon;
  final double? height;
  final Function() onTap;
  const ProfileWidget(
      {super.key, this.height, required this.onTap, required this.icon});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            height: 46,
            width: 46,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.grey),
            child: Center(
                child: Image.asset(
              widget.icon,
              height: widget.height ?? 7,
            )),
          ),
        ),
        const Spacer(),
        Container(
          height: 46,
          width: 46,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.grey),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/profile_image.png",
              )),
        )
      ],
    );
  }
}
