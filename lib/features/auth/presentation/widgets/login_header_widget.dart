              // const Text(
              //   'Welcome Back',
              //   style: TextStyle(
              //     color: AppColors.white,
              //     fontSize: 32,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // const SizedBox(height: AppSizes.insidePadding),
              // const Text(
              //   'Login to continue',
              //   style: TextStyle(color: Colors.white70, fontSize: 16),
              // ),

              import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Welcome Back',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppSizes.insidePadding),
        Text(
          'Login to continue',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ],
    );
  }
}