import 'package:ecosofe_app/common/custom_expanation_tile.dart';
import 'package:ecosofe_app/common/utils/app_buttons.dart';
import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/common.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:ecosofe_app/ui/contact_page/send_a_message_widget.dart';
import 'package:flutter/material.dart';

class AskedQuestionPage extends StatelessWidget {
  const AskedQuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: Colors.white,),onPressed: () => Navigator.of(context).pop(),),

        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "FAQ",
          style: TextStyles.bold(color: AppColors.forthColor, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomExpansionTile(
                  headerText: "What is EcoSafe?",
                  expansionListOfWidget: [
                    customRow(
                      text:
                          "EcoSafe is working in waste management in Egypt , We connect people with the environment, we use our power to enhance people's life. we use the technology to find the solution for climate change problem.",
                    ),
                  ]),
              const SizedBox(
                height: 16,
              ),
              CustomExpansionTile(
                  headerText: "Why choose EcoSafe?",
                  expansionListOfWidget: [
                    customRow(
                      text:
                          "EcoSafe is working in waste management in Egypt , We connect people with the environment, we use our power to enhance people's life. we use the technology to find the solution for climate change problem.",
                    ),
                  ]),
              const SizedBox(
                height: 16,
              ),
              CustomExpansionTile(
                headerText: "How can i make request ?",
                expansionListOfWidget: [
                  customRow(
                    text:
                        "EcoSafe is working in waste management in Egypt , We connect people with the environment, we use our power to enhance people's life. we use the technology to find the solution for climate change problem.",
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomExpansionTile(
                headerText: "What is benefit?",
                expansionListOfWidget: [
                  customRow(
                    text:
                        "EcoSafe is working in waste management in Egypt , We connect people with the environment, we use our power to enhance people's life. we use the technology to find the solution for climate change problem.",
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(
                    color: AppColors.forthColor,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Didn’t find an answer?",
                        style: TextStyles.bold(color: AppColors.blackColor,fontSize: 12),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: AppButton.primaryButton(
                                color: AppColors.forthColor,
                                title: "Send a message ",
                                verticalPadding: 0,
                                horizontalPadding: 0,
                                borderColor: AppColors.primaryColor,
                                textColor: AppColors.primaryColor,
                                onPressed: () {
                                  pushMaterialPage(
                                      context, const SendMessageWidget());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget customRow({required String text}) {
  return Row(
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
          ),
        ),
      )
    ],
  );
}
