import 'dart:async';

import 'package:ecosofe_app/common/utils/common.dart';
import 'package:ecosofe_app/domain/use_cases/authentication/check_if_user_login_use_case.dart';
import 'package:ecosofe_app/ui/auth/login_page.dart';
import 'package:flutter/material.dart';

import '../common/utils/app_colors.dart';
import 'host_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final CheckIfUserLogInUseCase _ifUserLogInUseCase = CheckIfUserLogInUseCase();

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () => _navigateTo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Center(
        child: Image.asset(
          "images/common/appLogo.png",
          scale: 3,
          // fit: BoxFit.fill,
        ),
      ),
    );
  }

  void _navigateTo() {
    final isLogIn = _ifUserLogInUseCase.execute();
    if (isLogIn) {
      navigateRemoveReplacement(context, const HostPage());
    } else {
      navigateRemoveReplacement(context, const LoginPage());
    }
  }
}
