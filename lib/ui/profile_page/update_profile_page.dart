// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosofe_app/common/firebase_keys/firebase_keys.dart';
import 'package:ecosofe_app/common/utils/app_buttons.dart';
import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/app_loader.dart';
import 'package:ecosofe_app/common/utils/app_snackbars.dart';
import 'package:ecosofe_app/common/utils/app_text_form_field.dart';
import 'package:ecosofe_app/common/utils/fail_widget.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:ecosofe_app/domain/models/user_data.dart';
import 'package:ecosofe_app/domain/use_cases/user/set_user_info_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _user = FirebaseFirestore.instance
      .collection(FireBaseUserKeys.userCollection)
      .doc(FirebaseAuth.instance.currentUser?.email);

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
          "Update Profile",
          style: TextStyles.bold(color: AppColors.forthColor, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: _user.get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const FailWidget();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppLoader();
          }
          if (snapshot.hasData && snapshot.data?.data() != null) {
            UserData userInfo = UserData.convert(snapshot.data!);
            return _UpdateProfileBody(
              user: userInfo,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class _UpdateProfileBody extends StatefulWidget {
  final UserData user;
  const _UpdateProfileBody({Key? key, required this.user}) : super(key: key);

  @override
  State<_UpdateProfileBody> createState() => _UpdateProfileBodyState();
}

class _UpdateProfileBodyState extends State<_UpdateProfileBody> {
  final SetUserInfoUseCase _setUserInfoUseCase = SetUserInfoUseCase();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  List<String> gender = ["Male", "Female"];
  String genderValue = 'Male';
  @override
  void initState() {
    _emailController.text = widget.user.emailAddress;
    _nameController.text = widget.user.name;
    _phoneNumberController.text = widget.user.phoneNumber;
    super.initState();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Profile Details",
                  style: TextStyles.regular(),
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFormField(
                  borderColor: AppColors.borderColor,
                  controller: _emailController,
                  hint: "Email",
                  isEnabled: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFormField(
                  borderColor: AppColors.borderColor,
                  controller: _nameController,
                  hint: "Name",
                  maxLength: 50,
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFormField(
                  borderColor: AppColors.borderColor,
                  controller: _phoneNumberController,
                  hint: "Phone Number",
                ),

                // const SizedBox(
                //   height: 16,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: DropdownButtonFormField(
                    value: genderValue,
                    iconEnabledColor: AppColors.textPrimaryColor,
                    items: gender.map<DropdownMenuItem<String>>((String value) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton.primaryButton(
                          title: "CANCEL",
                          verticalPadding: 0,
                          horizontalPadding: 0,
                          borderColor: AppColors.primaryColor,
                          textColor: AppColors.textPrimaryColor,
                          color: AppColors.forthColor,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: AppButton.primaryButton(
                          color: AppColors.primaryColor,
                          title: "SAVE",
                          verticalPadding: 0,
                          horizontalPadding: 0,
                          borderColor: AppColors.primaryColor,
                          textColor: AppColors.forthColor,
                          isLoading: _isLoading,
                          onPressed: _onSave,
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

  void _onSave() async {
    if (_formKey.currentState!.validate()) {
      _isLoading = true;
      setState(() {});
      UserData userData = UserData(
          name: _nameController.text,
          emailAddress: _emailController.text,
          password: widget.user.password,
          phoneNumber: _phoneNumberController.text,
          image: widget.user.image,
          gender: genderValue);
      final result = await _setUserInfoUseCase.execute(context, userData);
      if (result) {
        Navigator.of(context).pop();
        AppSnackBars.success(context, title: 'Profile Updated');
      }
      _isLoading = false;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
