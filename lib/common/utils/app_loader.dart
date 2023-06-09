import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.forthColor,
        strokeWidth: 3,
      ),
    );
  }
}
