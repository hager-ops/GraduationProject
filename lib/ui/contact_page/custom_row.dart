import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onTap;

  const CustomRow(
      {Key? key, required this.text, this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
              color: AppColors.forthColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(
                width: 20,
              ),
              Text(
                // "Update Profile",
                text,
                style: TextStyles.regular(),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_rounded,size: 16,),
            ],
          ),
        ),
      ),
    );
  }
}
