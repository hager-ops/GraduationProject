import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:flutter/material.dart';

class DeliveredViewWidget extends StatelessWidget {
  const DeliveredViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 24
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                  color: AppColors.forthColor),
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Center(
                      child: SizedBox(
                        width: 64,
                        height: 64,
                        child: Image.asset(
                          "images/common/bollets_image.jpg",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Big Bollet",
                            style: TextStyles.regular(),
                          ),
                          const SizedBox(height: 16,),
                          Text(
                            "qly 3",
                            style: TextStyles.regular(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Center(
                      child: SizedBox(
                        width: 64,
                        height: 64,
                        child: Image.asset(
                          "images/common/bollets_image.jpg",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Used Oil",
                            style: TextStyles.regular(),
                          ),
                          const SizedBox(height: 16,),
                          Text(
                            "qly 4",
                            style: TextStyles.regular(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(
                  color: AppColors.greyColor,
                  thickness: 2,
                  endIndent: 10,
                  indent: 10,
                ),
                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Text(
                        "SubTotal",
                        style: TextStyles.bold(),
                      ),
                      const SizedBox(width: 16,),
                      Text(
                        "900 EGP",
                        style: TextStyles.bold(
                          color: AppColors.primaryColor
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
