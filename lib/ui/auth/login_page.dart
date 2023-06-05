// ignore_for_file: use_build_context_synchronously

import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/domain/use_cases/authentication/log_in_use_case.dart';
import 'package:flutter/material.dart';
import 'package:ecosofe_app/common/utils/app_buttons.dart';
import 'package:ecosofe_app/common/utils/app_text_form_field.dart';
import 'package:ecosofe_app/common/utils/common.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:ecosofe_app/ui/auth/register_page.dart';
import 'package:ecosofe_app/ui/host_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  "images/common/appLogo.png",
                  scale: 3,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .1,
                ),
                const LoginFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final LogInUseCase _logInUseCase = LogInUseCase();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25,
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
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
              child: Column(
                children: [
                  AppTextFormField(
                    controller: _emailController,
                    hint: "Email Address",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFormField(
                    controller: _passwordController,
                    hint: "Password",
                    maxLength: 50,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AppButton.primaryButton(
                    title: "Login",
                    isLoading: _isLoading,
                    onPressed: _onLogIn,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Text(
                  //   "OR",
                  //   style: TextStyles.regular(
                  //     fontSize: 12,
                  //     color: AppColors.textPrimaryColor,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       width: 60,
                  //       height: 60,
                  //       margin: const EdgeInsets.symmetric(horizontal: 10),
                  //       padding: const EdgeInsets.symmetric(vertical: 12),
                  //       decoration: BoxDecoration(
                  //         color: AppColors.forthColor,
                  //         borderRadius: BorderRadius.circular(4),
                  //         border: Border.all(color: Colors.white, width: 1),
                  //       ),
                  //       child: Image.asset(
                  //         "images/common/facebook.png",
                  //         fit: BoxFit.contain,
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {},
                  //       behavior: HitTestBehavior.translucent,
                  //       child: Container(
                  //         height: 60,
                  //         width: 60,
                  //         margin: const EdgeInsets.symmetric(horizontal: 10),
                  //         padding: const EdgeInsets.symmetric(vertical: 12),
                  //         decoration: BoxDecoration(
                  //           color: AppColors.forthColor,
                  //           borderRadius: BorderRadius.circular(4),
                  //           border: Border.all(color: Colors.white, width: 1),
                  //         ),
                  //         child: Image.asset(
                  //           "images/common/google.png",
                  //           width: 20,
                  //           height: 20,
                  //           fit: BoxFit.contain,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: GestureDetector(
            onTap: () {
              pushMaterialPage(context, const RegisterPage());
            },
            child: Text(
              "Dont have account ? Create one",
              style: TextStyles.bold(
                fontSize: 16,
                color: AppColors.forthColor,
              ),
            ),
          ),
        )
      ],
    );
  }

  void _onLogIn() async {
    if (_formKey.currentState!.validate()) {
      _isLoading = true;
      setState(() {});
      final result = await _logInUseCase.execute(context,
          email: _emailController.text, password: _passwordController.text);
      if (result) {
        navigateRemoveReplacement(context, const HostPage());
      }
      _isLoading = false;
      setState(() {});
    }
  }
}
