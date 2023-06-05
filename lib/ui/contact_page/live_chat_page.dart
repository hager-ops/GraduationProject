import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:flutter/material.dart';

class LiveChatPage extends StatelessWidget {
  const LiveChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Live Chat",
          style: TextStyles.bold(color: AppColors.forthColor, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Text(
          "Coming Soon...",
          style: TextStyles.bold(color: AppColors.forthColor, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
