// ignore_for_file: use_build_context_synchronously

import 'package:ecosofe_app/common/utils/app_buttons.dart';
import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/app_text_form_field.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:ecosofe_app/domain/use_cases/authentication/update_password_use_case.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final UpdatePasswordUseCase _updatePasswordUseCase = UpdatePasswordUseCase();
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();
  var _passwordObscured = true;
  void onEyePressed() {
    setState(() {
      _passwordObscured = !_passwordObscured;
    });
  }

  bool _isLoading = false;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Change Password",
          style: TextStyles.bold(color: AppColors.forthColor, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              width: 1, style: BorderStyle.solid, color: AppColors.forthColor),
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Update Password",
                  style: TextStyles.bold(),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextFormField(
                  controller: _newPasswordController,
                  hint: "New password",
                  suffix: GestureDetector(
                    onTap: onEyePressed,
                    behavior: HitTestBehavior.translucent,
                    child: Icon(
                      _passwordObscured
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      color: AppColors.textPrimaryColor,
                      size: _passwordObscured ? 16 : 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFormField(
                  suffix: GestureDetector(
                    onTap: onEyePressed,
                    child: Icon(
                      _passwordObscured
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      color: AppColors.textPrimaryColor,
                      size: _passwordObscured ? 16 : 14,
                    ),
                  ),
                  controller: _confirmNewPasswordController,
                  hint: "Confirm New password",
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton.primaryButton(
                          color: AppColors.primaryColor,
                          title: "UPDATE PASSWORD",
                          verticalPadding: 0,
                          horizontalPadding: 0,
                          borderColor: AppColors.primaryColor,
                          textColor: AppColors.forthColor,
                          isLoading: _isLoading,
                          onPressed: _onUpdate,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onUpdate() async {
    _isLoading = true;
    setState(() {});
    if (_formKey.currentState?.validate() ?? false) {
      final result = await _updatePasswordUseCase.execute(context,
          password: _newPasswordController.text,
          confirmPassword: _confirmNewPasswordController.text);
      if (result) {
        Navigator.of(context).pop();
      }
    }
    _isLoading = false;
    setState(() {});
  }
}
