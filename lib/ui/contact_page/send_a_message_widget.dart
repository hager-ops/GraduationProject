import 'package:ecosofe_app/common/utils/app_buttons.dart';
import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/app_text_form_field.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:flutter/material.dart';

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: Colors.white,),onPressed: () => Navigator.of(context).pop(),),
        title: Text(
          "Inquiry",
          style: TextStyles.bold(color: AppColors.forthColor,fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Subject",
                      style: TextStyles.bold(fontSize: 12),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                      child: AppTextFormField(
                        hint: "Message Subject",
                        color: AppColors.forthColor,
                        hintTextFontSize: 16,
                      ),
                    ),
                    Text(
                      "Message",
                      style: TextStyles.bold(fontSize: 12),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                      child: AppTextFormField(
                        hint: "How can we help?",

                        color: AppColors.forthColor,
                        maxLines: 6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: AppButton.primaryButton(
                color: AppColors.forthColor,
                title: "Send",
                textColor: AppColors.primaryColor,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
