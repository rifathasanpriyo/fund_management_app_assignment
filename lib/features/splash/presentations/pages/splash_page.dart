import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';

import '../../../../app/route/app_routes.dart';
import '../../../../core/local_database/auth_db.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SessionManager _session = SessionManager();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 1));

    final token = await _session.getToken();

    if (token != null && token.isNotEmpty) {
      //  Token available
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.dashboardPage,
        (route) => false,
      );
    } else {
      //  Token not available
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.loginPage,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset('assets/fund_logo.png', width: 280, height: 280),
      ),
    );
  }
}
