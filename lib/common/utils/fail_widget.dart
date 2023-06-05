import 'package:ecosofe_app/common/utils/app_buttons.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class FailWidget extends StatelessWidget {
  const FailWidget({Key? key, this.onRetry}) : super(key: key);
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline_outlined,
            color: AppColors.forthColor,
            size: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Failed To Load , Check Your Internet Connection',
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.bold(
                    height: 1.5, fontSize: 18, color: AppColors.forthColor)),
          ),
          const SizedBox(
            height: 25,
          ),
          Visibility(
              replacement: const SizedBox(),
              visible: onRetry != null,
              child: AppButton.primaryButton(
                title: 'Reload',
                onPressed: () => onRetry,
              )),
        ],
      ),
    );
  }
}
