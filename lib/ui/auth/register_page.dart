// ignore_for_file: use_build_context_synchronously

import 'package:ecosofe_app/common/utils/app_buttons.dart';
import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/app_snackbars.dart';
import 'package:ecosofe_app/common/utils/app_text_form_field.dart';
import 'package:ecosofe_app/common/utils/common.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:ecosofe_app/domain/models/user_data.dart';
import 'package:ecosofe_app/domain/use_cases/authentication/register_use_case.dart';
import 'package:flutter/material.dart';

import 'compelete_register_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "images/common/appLogo.png",
                scale: 3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .1,
              ),
              const RegisterFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({Key? key}) : super(key: key);

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final RegisterUseCase _registerUseCase = RegisterUseCase();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  List<String> gender = ["Male", "Female"];
  String genderValue = 'Male';

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 32,
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                children: [
                  AppTextFormField(
                    controller: _nameController,
                    hint: "Name",
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFormField(
                    controller: _emailController,
                    hint: "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFormField(
                    controller: _passwordController,
                    hint: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFormField(
                    controller: _passwordConfirmController,
                    hint: "Confirm Password",
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFormField(
                    controller: _mobileNumberController,
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                    hint: "Mobile Number",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: DropdownButtonFormField(
                      value: genderValue,
                      iconEnabledColor: AppColors.textPrimaryColor,
                      items:
                          gender.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyles.regular(
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          genderValue = value!;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: AppColors.borderColor)),
                        border: OutlineInputBorder(
                            gapPadding: 0,
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: AppColors.borderColor)),
                        focusedBorder: OutlineInputBorder(
                            gapPadding: 0,
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: AppColors.borderColor)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: AppButton.primaryButton(
                        title: "Next",
                        isLoading: _isLoading,
                        onPressed: _onRegister),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onRegister() async {
    if (_formKey.currentState!.validate()) {
      _isLoading = true;
      setState(() {});
      if (_passwordController.text == _passwordConfirmController.text) {
        UserData userData = UserData(
            name: _nameController.text,
            emailAddress: _emailController.text,
            password: _passwordController.text,
            phoneNumber: _mobileNumberController.text,
            gender: genderValue);
        final result = await _registerUseCase.execute(context, userData);
        if (result) {
          navigateRemoveReplacement(context, const CompleteRegisterPage());
        }
      } else {
        AppSnackBars.hint(context,
            title: 'Password and Confirm Password Should Be Identical');
      }
      _isLoading = false;
      setState(() {});
    }
  }
}
