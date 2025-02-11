import 'package:credbevy/helpers/theme/app_colors.dart';
import 'package:credbevy/widgets/app_back_button.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final Widget? bottom;
  const AppScaffold({this.bottom, required this.body, this.appBar, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: body,
            appBar: appBar,
            bottomNavigationBar: bottom));
  }
}

AppBar appBar(
    {bool showBackButton = true,
    bool showSupportIcon = true,
    Widget? title,
    Widget? suffixItem,
    Function? onBackPressed,
    String? backButtonText,
    bool disableBackButtonTap = false}) {
  return AppBar(
    shadowColor: Colors.transparent,
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 12),
      child: Row(
        children: [
          if (showBackButton) ...[
            AppBackButton(
              onBackPressed: onBackPressed,
            ),
          ],
          if (title != null) ...[
            Expanded(child: title)
          ] else ...[
            const Spacer(),
          ],
          if (showSupportIcon) ...[suffixItem ?? const SizedBox()]
        ],
      ),
    ),
    leadingWidth: double.infinity,
  );
}
