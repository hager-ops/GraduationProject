import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_styles.dart';

class AppSnackBars extends StatelessWidget {
  const AppSnackBars({
    Key? key,
    this.duration,
    this.icon,
    required this.title,
    this.subTitle,
    this.borderSide,
    this.elevation,
    this.color,
    this.snackBarBehavior,
    this.leadingWidget,
    this.textColor,
  }) : super(key: key);

  final int? duration;
  final IconData? icon;
  final String title;
  final String? subTitle;
  final BorderSide? borderSide;
  final double? elevation;
  final Color? color;
  final Color? textColor;
  final SnackBarBehavior? snackBarBehavior;
  final Widget? leadingWidget;

  static void success(context, {required String title, String? subTitle}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBars(
        title: title,
        subTitle: subTitle,
        icon: Icons.check_circle_outline,
        borderSide: const BorderSide(width: 1.2, color: AppColors.borderColor),
      ).build(context) as SnackBar,
    );
  }

  static void error(context, {required String title, String? subTitle}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBars(
        title: title,
        subTitle: subTitle,
        color: Colors.redAccent,
        icon: Icons.error_outline,
        textColor: Colors.white,
      ).build(context) as SnackBar,
    );
  }

  static void warning(context, {required String title, String? subTitle}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBars(
        title: title,
        subTitle: subTitle,
        color: AppColors.warningLight,
        icon: Icons.warning,
        borderSide: const BorderSide(width: 1, color: AppColors.warning),
      ).build(context) as SnackBar,
    );
  }

  static void hint(context, {required String title}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBars(
        title: title,
        icon: Icons.lightbulb_outline,
        borderSide: const BorderSide(width: 1, color: AppColors.borderColor),
      ).build(context) as SnackBar,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      duration: Duration(seconds: duration ?? 4),
      backgroundColor: color ?? Colors.white,
      elevation: elevation,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: textColor,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(
                //   height: 5,
                // ),
                Text(
                  title,
                  style: TextStyles.medium(
                    color: textColor ?? AppColors.textPrimaryColor,
                  ),
                ),
                subTitle != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          subTitle!,
                          style: TextStyles.regular(
                              color: AppColors.textSecondaryColor, height: 1.1),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
