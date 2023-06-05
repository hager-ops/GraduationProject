import 'package:ecosofe_app/common/utils/app_buttons.dart';
import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ConfirmCartPage extends StatelessWidget {
  const ConfirmCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.width*.2,),
            Image.asset(
              "images/common/success.png",
              scale: 3,
            ),
            SizedBox(height: MediaQuery.of(context).size.width*.1,),
            Text(
              "Request confirmed",
              style: TextStyles.bold(color: AppColors.blackColor),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: MediaQuery.of(context).size.height * .2),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton.primaryButton(
                      color: AppColors.forthColor,
                      title: "Done!",
                      verticalPadding: 0,
                      horizontalPadding: 0,
                      borderColor: AppColors.primaryColor,
                      textColor: AppColors.blackColor,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
