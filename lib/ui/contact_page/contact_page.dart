import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/common.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:ecosofe_app/ui/contact_page/asked_question_page.dart';
import 'package:ecosofe_app/ui/contact_page/custom_row.dart';
import 'package:ecosofe_app/ui/contact_page/live_chat_page.dart';
import 'package:ecosofe_app/ui/contact_page/others_inquiry_page.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Inquiry",
          style: TextStyles.bold(color: AppColors.forthColor, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomRow(
              text: "Frequently Asked Question",
              icon: Icons.cached_outlined,
              onTap: () {
                pushMaterialPage(context, const AskedQuestionPage());
              },
            ),
            CustomRow(
              text: "Others Inquiry",
              icon: Icons.question_mark,
              onTap: () {
                pushMaterialPage(context, const OthersInquiryPage());
              },
            ),
            CustomRow(
              text: "Live Chat",
              icon: Icons.chat_bubble_outlined,
              onTap: () {
                pushMaterialPage(context, const LiveChatPage());
              },
            )
          ],
        ),
      ),
    );
  }
}
