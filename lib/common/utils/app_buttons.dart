import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'text_styles.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool isBold;
  final Color textColor;
  final Color backgroundColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double cornerRadius;
  final double borderWidth;
  final Color borderColor;
  final IconData? buttonIcon;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isBold = true,
    this.textColor = AppColors.textPrimaryColor,
    this.backgroundColor = AppColors.buttonPrimaryColor,
    this.horizontalPadding = 48,
    this.verticalPadding = 8,
    this.cornerRadius = 5,
    this.borderWidth = 0,
    this.borderColor = AppColors.borderPrimaryColor,
    double? buttonHeight,
    double? buttonWidth = 16,
    this.buttonIcon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => backgroundColor),
              padding: MaterialStateProperty.all(EdgeInsets.only(
                  right: horizontalPadding,
                  left: horizontalPadding,
                  top: verticalPadding,
                  bottom: verticalPadding)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
                  side: BorderSide(
                    width: borderWidth,
                    color: borderColor,
                  ))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 12,
                ),
                Text(
                  title,
                  style: isBold
                      ? TextStyles.bold(color: textColor, fontSize: 16)
                      : TextStyles.medium(color: textColor, fontSize: 16),
                ),
                const SizedBox(
                  width: 10,
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  key: ValueKey(isLoading),
                  child: isLoading
                      ? const SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            color: AppColors.forthColor,
                            strokeWidth: 3,
                          ),
                        )
                      : const SizedBox(
                          width: 10,
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static AppButton primaryButton({
    required String title,
    required VoidCallback onPressed,
    bool isLoading = false,
    double horizontalPadding = 48,
    double verticalPadding = 0,
    double? buttonHeight,
    Color? color,
    Color? borderColor,
    Color? textColor,
    IconData? buttonIcon,
  }) {
    return AppButton(
      title: title,
      onPressed: onPressed,
      backgroundColor: color ?? AppColors.buttonPrimaryColor,
      borderColor: borderColor ?? Colors.transparent,
      isLoading: isLoading,
      cornerRadius: 4,
      textColor: textColor ?? AppColors.forthColor,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      buttonIcon: buttonIcon,
    );
  }
}
