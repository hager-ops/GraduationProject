import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:flutter/material.dart';

import 'utils/app_colors.dart';

class EmptyViewBody extends StatelessWidget {
  final String text, image;
  final String? btnText;
  final VoidCallback? onTap;
  final bool? isShowButton;

  const EmptyViewBody({
    Key? key,
    required this.text,
    required this.image,
    this.onTap,
    this.btnText,
    this.isShowButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          Center(
            child: Image.asset(
              image,
              fit: BoxFit.fill,
              scale: 3,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyles.medium(
              fontSize: 24,
              height: 1.4,
              color: AppColors.textPrimaryColor,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
