// ignore_for_file: use_build_context_synchronously

import 'package:ecosofe_app/common/utils/app_buttons.dart';
import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/common.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:ecosofe_app/domain/use_cases/authentication/log_out_use_case.dart';
import 'package:ecosofe_app/ui/auth/login_page.dart';
import 'package:ecosofe_app/ui/contact_page/custom_row.dart';
import 'package:ecosofe_app/ui/profile_page/change_password_page.dart';
import 'package:ecosofe_app/ui/profile_page/my_address/my_address_page.dart';
import 'package:ecosofe_app/ui/profile_page/update_profile_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final LogOutUseCase _logOutUseCase = LogOutUseCase();
  bool _logOutLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "My Account",
          style: TextStyles.bold(color: AppColors.forthColor, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomRow(
                text: 'Update Profile',
                icon: Icons.perm_identity_outlined,
                onTap: () {
                  pushMaterialPage(context, const UpdateProfilePage());
                },
              ),
              CustomRow(
                  text: 'Change Password',
                  icon: Icons.password_sharp,
                  onTap: () {
                    pushMaterialPage(context, const ChangePasswordPage());
                  }),
              CustomRow(
                  text: 'My Address',
                  icon: Icons.location_on_rounded,
                  onTap: () {
                    pushMaterialPage(context, const MyAddressPage());
                  }),
              CustomRow(
                text: 'Logout',
                icon: Icons.login_sharp,
                onTap: () {
                  showAlertDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogOut() async {
    _logOutLoading = true;
    setState(() {});
    final bool result = await _logOutUseCase.execute(context);
    if (result) {
      Navigator.of(context).pop();
      navigateRemoveReplacement(context, const LoginPage());
    }
    _logOutLoading = false;
    setState(() {});
  }

  Future<void> showAlertDialog(BuildContext context) async {
    // show the dialog
    showDialog(
      context: context,
      useRootNavigator: true,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.forthColor,
          insetPadding: const EdgeInsets.all(30),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .85,
                ),
                Text(
                  "LogOut?",
                  style: TextStyles.bold(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Are you sure want to log out ?",
                  style: TextStyles.medium(),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
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
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: AppButton.primaryButton(
                          color: AppColors.primaryColor,
                          title: "LOGOUT",
                          verticalPadding: 0,
                          horizontalPadding: 0,
                          borderColor: AppColors.primaryColor,
                          textColor: AppColors.forthColor,
                          isLoading: _logOutLoading,
                          onPressed: _onLogOut),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
